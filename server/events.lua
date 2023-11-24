local AC = exports['id_core']:getACUtils()
local playerLoadEvent = 'id_core:playerLoaded'
if Core.Settings.Framework.Name == 'ESX' then playerLoadEvent = 'esx:playerLoaded' end

--================
--==    Admin   ==
--================
RegisterNetEvent('id_gangsystem:admin:createGang', function(data, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    if not gangList[data.name] then
        local ranks = {}
        for k,v in pairs(Config.Gang.default.ranks) do
            table.insert(ranks, {
                id = tonumber(k),
                name = v.name,
                label = v.label,
                perms = Config.Gang.defaultPerms[v.permLevel]
            })
        end

        exports.oxmysql:insert('INSERT INTO id_gangs (name, label, money, ranks, maxMembers, maxPushers, locations) VALUES (?,?,?,?,?,?,?)', {data.name, data.label, data.money, json.encode(ranks), data.maxMembers, data.maxPushers, json.encode(data.locations)},function()
            data.ranks = ranks
            gangList[data.name] = data
            exports.oxmysql:insert('INSERT INTO items (name, label, weight) VALUES (?,?,0), (?,?,1);', {'keys_gang_'..data.name, _U('items:key', data.label), 'gang_phone_'..data.name, _U('items:phone', data.label)})
            TriggerClientEvent('id_notify:notify', src, {
                message = _U('admin:createGang:gangCreated', data.label),
                type = 'success'
            })
            Core.Logs:SendLog(GetCurrentResourceName()..'::admin:create', _('logs:admin::create', GetPlayerName(src), data.name, data.label, Core.Utils.Math:GroupDigits(data.money), data.maxMembers, data.maxPushers), src)
        end)
    else
        TriggerClientEvent('id_notify:notify', src, {
            message = _U('admin:editGang:gangExist', data.name),
            type = 'error'
        })
    end
end)

RegisterNetEvent('id_gangsystem:admin:updateGang', function(gangData, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    local gang = Exports.getGangByName(gangData.name)
    gang.money = gangData.money
    gang.maxMembers = gangData.maxMembers
    gang.maxPushers = gangData.maxPushers

    exports.oxmysql:update('UPDATE id_gangs SET money = ?, maxMembers = ?, maxPushers = ? WHERE name = ?', {gangData.money, gangData.maxMembers, gangData.maxPushers, gangData.name}, function()
        local members = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ?', {gangData.name})
        if members and members[1] then
            for k,v in pairs(members) do
                local zPlayer = ESX.GetPlayerFromIdentifier(v.identifier)
                if zPlayer then
                    updatePlayerGangData(zPlayer.source)
                end
            end
        end
        TriggerClientEvent('id_notify:notify', src, {
            message = _U('admin:editGang::edited', gangData.label),
            type = 'custom',
            icon = 'fas fa-user-edit'
        })
        Core.Logs:SendLog(GetCurrentResourceName()..'::admin:edit', _('logs:admin::edit', GetPlayerName(src), gangData.label, Core.Utils.Math:GroupDigits(gangData.money), gangData.maxMembers, gangData.maxPushers), src)
    end)
end)

RegisterNetEvent('id_gangsystem:admin:deleteGang', function(gangData, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    exports.oxmysql:query('DELETE FROM id_gangs WHERE name = ?', {gangData.name}, function()
        local members = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ?', {gangData.name})
        if members and members[1] then
            exports.oxmysql:update('UPDATE users SET gang = ?, gang_rank = ? WHERE gang = ?', {nil, nil, gangData.name}, function()
                for k,v in pairs(members) do
                    local zPlayer = ESX.GetPlayerFromIdentifier(v.identifier)
                    if zPlayer then
                        updatePlayerGangData(zPlayer.source)
                    end
                end
            end)
        end
        gangList[gangData.name] = nil
        exports.oxmysql:query('DELETE FROM items WHERE name = ?', {'keys_gang_'..gangData.name})
        exports.oxmysql:query('DELETE FROM items WHERE name = ?', {'gang_phone_'..gangData.name})
        TriggerClientEvent('id_notify:notify', src, {
            message = _U('admin:editGang::deleted', gangData.label),
            type = 'success',
        })
        Core.Logs:SendLog(GetCurrentResourceName()..'::admin:delete', _('logs:admin::delete', GetPlayerName(src), gangData.label, gangData.name), src)
    end)
end)

--================
--==    Gang    ==
--================
RegisterNetEvent('id_gangsystem:gang:setGangRank', function(gangName, rankData, targetData, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    local gang = Exports.getGangByName(gangName)
    if rankData.value == 'pusher' then
        local pushers = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ? AND gang_rank = ?', {gangName, 'pusher'})
        if #pushers == gang.maxPushers then
            TriggerClientEvent('id_notify:notify', src, {
                message = _U('gang:menu:actionMenu:memberAdd:noSpace::pusher'),
                type = 'error'
            })
            return
        end
    elseif targetData.rank == 'pusher' then
        local members = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ? AND gang_rank != ?', {gangName, 'pusher'})
        if #members == gang.maxMembers then
            TriggerClientEvent('id_notify:notify', src, {
                message = _U('gang:menu:actionMenu:memberAdd:noSpace::member'),
                type = 'error'
            })
            return
        end
    end

    exports.oxmysql:update('UPDATE users SET gang_rank = ? WHERE identifier = ?', {rankData.value, targetData.identifier}, function()
        local zPlayer = ESX.GetPlayerFromIdentifier(targetData.identifier)
        if zPlayer then updatePlayerGangData(zPlayer.source) end
        TriggerClientEvent('id_notify:notify', src, {
            message = _U('gang:menu:actionMenu:memberList:action:promote::promoted', targetData.name, rankData.label),
            type = 'custom',
            icon = 'fas fa-user-edit'
        })
    end)
end)

RegisterNetEvent('id_gangsystem:gang:removeMember', function(gangName, targetData, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    exports.oxmysql:update('UPDATE users SET gang = ?, gang_rank = ? WHERE identifier = ?', {nil, nil, targetData.identifier}, function()
        local zPlayer = ESX.GetPlayerFromIdentifier(targetData.identifier)
        local tsrc = nil
        if zPlayer then updatePlayerGangData(zPlayer.source) tsrc = zPlayer.source end
        TriggerClientEvent('id_notify:notify', src, {
            message = _U('gang:menu:actionMenu:memberList:action:remove::removed', targetData.name),
            type = 'custom',
            icon = 'fas fa-user-minus'
        })
        Core.Logs:SendLog(GetCurrentResourceName()..'::gang:removemember', _('logs:gang::removemember', xPlayer.getName(), targetData.name, Exports.getGangByName(gamgName).label), {src, tsrc})
    end)
end)

RegisterNetEvent('id_gangsystem:gang:memberAdd', function(gangName, target, type, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    if type == 'member' then
        local members = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ? AND gang_rank != ?', {gangName, 'pusher'})
        local gang = Exports.getGangByName(gangName)
        if members and members[1] then
            local zPlayer = ESX.GetPlayerFromId(target)
            if #members < gang.maxMembers then
                local rank

                exports.oxmysql:update('UPDATE users SET gang = ?, gang_rank = ? WHERE identifier = ?', {gang.name, 'trial_member', zPlayer.getIdentifier()}, function()
                    TriggerClientEvent('id_notify:notify', src, {
                        message = _U('gang:menu:actionMenu:memberAdd:added::member', zPlayer.getName()),
                        type = 'custom',
                        icon = 'fas fa-user-plus'
                    })
                    updatePlayerGangData(target)
                    Core.Logs:SendLog(GetCurrentResourceName()..'::gang:addmember', _('logs:gang::addmember', xPlayer.getName(), zPlayer.getName(), gang.label, 'Member'), {src, target})
                end)
            else
                TriggerClientEvent('id_notify:notify', src, {
                    message = _U('gang:menu:actionMenu:memberAdd:noSpace::member'),
                    type = 'error'
                })
            end
        end
    elseif type == 'pusher' then
        local pushers = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ? AND gang_rank = ?', {gangName, 'pusher'})
        local gang = Exports.getGangByName(gangName)
        if pushers then
            local zPlayer = ESX.GetPlayerFromId(target)
            if #pushers < gang.maxPushers then
                local rank

                exports.oxmysql:update('UPDATE users SET gang = ?, gang_rank = ? WHERE identifier = ?', {gang.name, 'pusher', zPlayer.getIdentifier()}, function()
                    TriggerClientEvent('id_notify:notify', src, {
                        message = _U('gang:menu:actionMenu:memberAdd:added::pusher', zPlayer.getName()),
                        type = 'custom',
                        icon = 'fas fa-user-plus'
                    })
                    updatePlayerGangData(target)
                    Core.Logs:SendLog(GetCurrentResourceName()..'::gang:addmember', _('logs:gang::addmember', xPlayer.getName(), zPlayer.getName(), gang.label, 'Pusher'), {src, target})
                end)
            else
                TriggerClientEvent('id_notify:notify', src, {
                    message = _U('gang:menu:actionMenu:memberAdd:noSpace::pusher'),
                    type = 'error'
                })
            end
        end
    end
end)

RegisterNetEvent('id_gangsystem:gang:editRank', function(gangName, value, type, rankName, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    local gang = Exports.getGangByName(gangName)
    local rankLabel
    for k,v in pairs(gang.ranks) do
        if v.name == rankName then
            rankLabel = v.label
        end

        if type == 'label' then
            if v.name == rankName then
                v.label = value
                rankLabel = value
                break
            end
        elseif type == 'moveUp' then
            if v.name == rankName then
                v.id = v.id - 1
            elseif v.id == value and v.name ~= rankName then
                v.id = v.id + 1
            end
        elseif type == 'moveDown' then
            if v.name == rankName then
                v.id = v.id + 1
            elseif v.id == value and v.name ~= rankName then
                v.id = v.id - 1
            end
        end
    end

    exports.oxmysql:update('UPDATE id_gangs SET ranks = ? WHERE name = ?', {json.encode(gang.ranks), gang.name}, function()
        TriggerClientEvent('id_notify:notify', src, {
            message = _U('gang:menu:actionMenu:rankList:action:edited::'..type, rankName, value),
            type = 'custom',
            icon = 'fas fa-edit'
        })
        local members = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ?', {gang.name})
        if members and members[1] then
            for k,v in pairs(members) do
                local zPlayer = ESX.GetPlayerFromIdentifier(v.identifier)
                if zPlayer then
                    updatePlayerGangData(zPlayer.source)
                end
            end
        end
    end)
end)

RegisterNetEvent('id_gangsystem:gang:removeRank', function(gangName, rankName, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    local gang = Exports.getGangByName(gangName)
    local rankLabel, rankId
    for k,v in pairs(gang.ranks) do
        if v.name == rankName then
            rankLabel = v.label
            rankId = v.id
            table.remove(gang.ranks, k)
            break
        end
    end

    for k,v in pairs(gang.ranks) do
        if v.id > rankId then
            v.id = v.id - 1
        end
    end

    exports.oxmysql:update('UPDATE id_gangs SET ranks = ? WHERE name = ?', {json.encode(gang.ranks), gang.name}, function()
        local members = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ? AND gang_rank = ?', {gangName, rankName})
        if members and members[1] then
            for k,v in pairs(members) do
                exports.oxmysql:update('UPDATE users SET gang_rank = ? WHERE gang = ? AND gang_rank = ? AND identifier = ?', {'trial_member', gang.name, rankName, v.identifier}, function()
                    local zPlayer = ESX.GetPlayerFromIdentifier(v.identifier)
                    if zPlayer then
                        updatePlayerGangData(zPlayer.source)
                    end
                end)
            end
        end
        TriggerClientEvent('id_notify:notify', src, {
            message = _U('gang:menu:actionMenu:rankList:action:remove::removed', rankLabel),
            type = 'custom',
            icon = 'fas fa-trash-alt'
        })
    end)
end)

RegisterNetEvent('id_gangsystem:gang:editPerms', function(gangName, rankPerms, rankName, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    local gang = Exports.getGangByName(gangName)
    local rankLabel
    for k,v in pairs(gang.ranks) do
        if v.name == rankName then
            v.perms = rankPerms
            rankLabel = v.label
            break
        end
    end

    exports.oxmysql:update('UPDATE id_gangs SET ranks = ? WHERE name = ?', {json.encode(gang.ranks), gang.name}, function()
        TriggerClientEvent('id_notify:notify', src, {
            message = _U('gang:menu:actionMenu:rankList:action:perms:edit::savedPerms', rankLabel),
            type = 'custom',
            icon = 'fas fa-edit'
        })
        local members = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ?', {gang.name})
        if members and members[1] then
            for k,v in pairs(members) do
                local zPlayer = ESX.GetPlayerFromIdentifier(v.identifier)
                if zPlayer then
                    updatePlayerGangData(zPlayer.source)
                end
            end
        end
    end)
end)

RegisterNetEvent('id_gangsystem:gang:rankAdd', function(gangName, rankData, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    local gang = Exports.getGangByName(gangName)
    rankData.id = #gang.ranks - 1
    for k,v in pairs(gang.ranks) do
        if v.name == rankData.name then
            TriggerClientEvent('id_notify:notify', src, {
                message = _U('gang:menu:actionMenu:rankList:action:rankAdd::exist', rankData.name),
                type = 'error',
            })
            return
        end

        if v.name == 'trial_member' or v.name == 'pusher' then
            v.id = v.id + 1
        end
    end

    table.insert(gang.ranks, rankData)

    exports.oxmysql:update('UPDATE id_gangs SET ranks = ? WHERE name = ?', {json.encode(gang.ranks), gang.name}, function()
        TriggerClientEvent('id_notify:notify', src, {
            message = _U('gang:menu:actionMenu:rankList:action:rankAdd::added', rankData.label),
            type = 'success',
        })
        local members = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ?', {gang.name})
        if members and members[1] then
            for k,v in pairs(members) do
                local zPlayer = ESX.GetPlayerFromIdentifier(v.identifier)
                if zPlayer then
                    updatePlayerGangData(zPlayer.source)
                end
            end
        end
    end)
end)

--================
--==    Shop    ==
--================
RegisterNetEvent('id_gangsystem:shop:buyItem', function(itemName, items, amount, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    local gang = Exports.getPlayerGang(src)
    local xItem = xPlayer.getInventoryItem(itemName)
    local price = 0
    local perm

    if xItem then
        for k,v in pairs(items) do
            if v.name == xItem.name then
                price = v.price * amount
                if v.options.perm then perm = v.options.perm end
                break
            end
        end

        if perm then
            if not Exports.hasPlayerGangPerm(src, perm) then
                TriggerClientEvent('id_notify:notify', src, {
                    message = _U('shop:buyItem::noPerm', xItem.label),
                    type = 'error'
                })
                return
            end
        end

        if Utils:canCarryItem(src, xItem.name, amount) then
            if gang.money >= price then
                Exports.takeGangMoney(gang.name, price)
                xPlayer.addInventoryItem(xItem.name, amount)
                TriggerClientEvent('id_notify:notify', src, {
                    message = _U('shop:buyItem::bought', amount, xItem.label, ESX.Math.GroupDigits(price)),
                    type = 'success'
                })
                Core.Logs:SendLog(GetCurrentResourceName()..'::shop:buyitem', _('logs:shop::buyitem', xPlayer.getName(), amount, xItem.label, gang.label), src)
            end
        else
            TriggerClientEvent('id_notify:notify', src, {
                message = _U('shop:buyItem::noSpace', amount, xItem.label),
                type = 'error'
            })
        end
    end
end)