serverEventCode = '3a3Hc5hvBHU$fqsS$m8XW=v4m#--6P2kCGpnPvrPKAnZkmC6CGSsXJmPZEmbTS37GQKLmz6Fm_V^LT3&#BdDvzdbj_vg*9VBUJ-G=afVLkKybB^-nWKe*H?!J!$4D--PW?tS^&529@uFsM_Z+aQ%=tr6aBav4pHz2vmKF&Y#JQ$PPM4sc7ku?QL=hg^T?_WkU?2-%#6Dh?5Y2__?SAgMX#3ktnR!8JaMXV76f2U-Ukz8@_k!u-X3xzBD!T6jD36_&&Agu@+gA$gsTL84!SVVdyEpQtWfKYkR_f&%@uUSPqnc2n5cuDB%MYhzzayVxbb*hxM&H8!!m_Q!wNVqS9Q9am*qg*&!B3Q=QmQQ5Chnw72A3+B@HeMEqA4+33a?Y4KXQ$-rk=Mtecgm^z9&C$uMw+*vmVD3P-jM7-2q$^nMBMcb+ab_Mvn?_m#X-6jnsfxn9%yDtC$T_TyR_t**2U4Dct+hxH#z_T5mR6a3_M*3$#S8Yvg*!Ph8g64w4pzFDk65P5Cu#HmTzLrKYw^97+4ykv4ZrKZ6%r^k677KU@*g^q7-M@HVTZbcv$+NdyRF5C7HR3pztY%-77ukQ$p?FEg%aQT*zbfR!qR5$9WEEGmFLmTb8^MdgPX7npf=kvTCTn=YMm4HNGNE3Vx2Dvz+gb_uhjxvwJs@@Ew8V2sb^BFc*+EVd8A5+5Kx7jJ5RNqQJmSCWvT^PkeF55rEqsus?*dyC=XMRQ&FdWmk_zK*FQHbmY7ex_SGT@7Qyv4$uXA+@BvRHt5tGNt6cmy&tYB^!Z526*=ZP=+m532PbcQZ79h5h^fVjEgjPHJHME?8J6$NpjbdqU!xf%2BS3e9tdBr29-kQy@U_km5%N6LAzwZ&Lt%j^bd75zS62Vg6MBbE^3k&bCUD?p%tS!nhG+5XpDAtbDBEF-^x49#NGau_&!J7qdKFjzS4^HbZ4APYr$+MgN?8NCVmEcb5FBj3cbj=aBRjkGaY=qz6Bb#vHSPbLXBk6knn?8w$J-a?Bc-X8zz$+LCkaJUWyxG+?DBL*8n2_aN6Z%XJ&TNNt!5rRwBW!gyux=$UNZTdH@GCqKy2zT^*zjQtrHPZ?EYheHPs5FkU+AbnBWMRg9sE=bXwFXwNd&=_Ncb$csZhd!vewUg%kUUfEBCRd#jVzkm9UhvLn@&^w=_M9SXnx-Z*XXkHkp!GLPg^4rDQqWv-3SZeu*3!dpmrk-SJ+4dh!HveEyw_9ZNsrpuF*5#aQfuaYp2aDxr?*&Q&^+WgUH@%pmY6&s_Yj%RGg!L^4^ewJxmp$ph-*p=Y6s8RrW6CsMy^zEeMnp$rU2Y-mCFGEpB&*L*9_4_=N&zma@GF?bqN$-X*KdyFfnsu!*_3^2^Nbe3&rswzedm5%kBdfKpjAgsxr$C^pDp4S?yt6+N-Z!*#^39bpktAx$_Zu!Xd5&wW=WumPw3VQ!WBLC_=526AfPeJunZUgzxbLEnf9B5g$rRAqbhCj_35Es!_5A%^XTNt8qp6sMZkkvX74=J-?4h#L*6JDU!wM*dJdNDWr$xR*+qP%wvw2tnVMEmhW^VcAWL$FZupfn!WjY2J5Kxhr^y#Zh$e$9b-bu8GEHjAR%LK*r^rh9CUxHf#MT83Pg6g@RjRbArMbdgAS3F!BQ3Jze4V%G=M9E+Kebf*s!VwHvAV^Tt*Fgr_&&s+8daTauE_cF*qzkc*ddkMn^UBmB@tb!PsjkNDV?-xgP7FwR#jYTYB2uCa!qk*%wg#GXcMV=jCr5hB$GzBH-xp?kh22S%V-?5N94t5Nq^JKkw+@Bktnx6=RgVd+svZ^K8uyj7BJvf*!EXKeHG29?Xjp+8rV5V9-fgXCF5$KfRSbefc9a2x5gCA2r@VCmSSHzkdbw&wJt4h!%X-s9MW9HHCExdh-?DGYjVzU-H$QS-RY9ptE6eRMzKa5xz*3x^V^%9bm@r3RMJ$nqA=D2352CH2YxP7T$J%2s8y-UG*5Ku&NLhX#WHHP!%7FzxnY4*=@9BBGM_S5h_F%Gwf$%rK#k**9mNu6KNzRBvSAa=rEbY@FBAB=9gj3uc9!-v'

--====================
--==    Variables   ==
--====================
GangData = nil
Exports = {}
inMarker, showPromp = nil, true

--===================
--==    Exports    ==
--===================
function Exports.getGangData()
    return GangData
end

function Exports.hasPlayerPerm(perm)
    local a,b = perm:find('%.')
    local starPerm = perm:sub(1, b-1)..'.*'

    for k,v in pairs(GangData.perms) do
        if v == starPerm or v == perm then
            return true
        end
    end

    return false
end

exports('getGangData', Exports.getGangData)
exports('hasPlayerPerm', Exports.hasPlayerPerm)

--================
--==    Admin   ==
--================
RegisterCommand('admin:creategang', function(src, args)
    ESX.TriggerServerCallback('id_gangsystem:admin:getAccess', function(hasAccess) 
        if hasAccess then
            if args[1] then
                local name = args[1]
                createGang(name)
            end
        end
    end, Config.Admin.perms.createGang)
end, false)
TriggerEvent('chat:addSuggestion', '/admin:creategang', 'Opret en bande', {{ name="navn", help="Servernavn på banden" }})

function createGang(name)
    ESX.UI.Menu.CloseAll()

    local elements = {
        {label = _U('admin:createGang:menu::name', name), index = 'name', value = name},
        {label = _U('admin:createGang:menu::label', 'Ny Bande'), index = 'label', value = 'Ny Bande'},
        {label = _U('admin:createGang:menu::money', Config.Gang.default.money), index = 'money', value = ESX.Math.GroupDigits(Config.Gang.default.money)},
        {label = _U('admin:createGang:menu::maxMembers', Config.Gang.default.maxMembers), index = 'maxMembers', value = Config.Gang.default.maxMembers},
        {label = _U('admin:createGang:menu::maxPushers', Config.Gang.default.maxPushers), index = 'maxPushers', value = Config.Gang.default.maxPushers},
        {label = _U('admin:createGang:menu::locations'), index = 'locations', value = Config.Gang.default.locations},
        {label = _U('admin:createGang:menu::create'), index = 'create'}
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'admin_creategang', {
        title = _U('admin:createGang:menu:title'),
        align = 'left',
        elements = elements
    }, function(data, menu)
        if data.current.index == 'label' then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_members', {
                title = _U('admin:createGang:menu:setLabel')
            }, function(data2, menu2)
                if data2.value then
                    menu2.close()
                    menu.setElement(2, 'label', _U('admin:createGang:menu::label', data2.value))
                    menu.setElement(2, 'value', data2.value)
                    menu.refresh()
                end
            end,function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.index == 'money' then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_money', {
                title = _U('amount')
            }, function(data2, menu2)
                if data2.value == 'nil' then data2.value = 0 end

                if data2.value and tonumber(data2.value) then
                    local val = tonumber(data2.value)
                    menu2.close()
                    menu.setElement(3, 'label', _U('admin:createGang:menu::money', ESX.Math.GroupDigits(val)))
                    menu.setElement(3, 'value', val)
                    menu.refresh()
                end
            end,function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.index == 'maxMembers' then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_members', {
                title = _U('amount')
            }, function(data2, menu2)
                if data2.value and tonumber(data2.value) then
                    local val = tonumber(data2.value)
                    menu2.close()
                    menu.setElement(4, 'label', _U('admin:createGang:menu::maxMembers', val))
                    menu.setElement(4, 'value', val)
                    menu.refresh()
                end
            end,function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.index == 'maxPushers' then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_pushers', {
                title = _U('amount')
            }, function(data2, menu2)
                if data2.value and tonumber(data2.value) then
                    local val = tonumber(data2.value)
                    menu2.close()
                    menu.setElement(5, 'label', _U('admin:createGang:menu::maxPushers', val))
                    menu.setElement(5, 'value', val)
                    menu.refresh()
                end
            end,function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.index == 'locations' then
            local elements2 = {}
            for k,v in pairs(data.current.value) do
                if v == 'none' then
                    table.insert(elements2, {
                        label = k..': Ingen placering',
                        index = k,
                        value = v
                    })
                else
                    local roundx = tonumber(string.format("%.2f", v.x))
                    local roundy = tonumber(string.format("%.2f", v.y))
                    local roundz = tonumber(string.format("%.2f", v.z))
                    table.insert(elements2, {
                        label = k..': '..v,
                        index = k,
                        value = v
                    })
                end
            end

            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'set_locations', {
                title = 'Lokationer',
                align = 'left',
                elements = elements2
            }, function(data2, menu2)
                local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
                local roundx = tonumber(string.format("%.2f", x))
                local roundy = tonumber(string.format("%.2f", y))
                local roundz = tonumber(string.format("%.2f", z))

                local val = vector3(roundx, roundy, roundz)

                for k,v in pairs(data2.elements) do
                    if v.index == data2.current.index then
                        menu2.setElement(k, 'label', data2.current.index..': '..val)
                        menu2.setElement(k, 'value', val)
                        menu2.refresh()
                        
                        local a = data.current.value
                        a[v.index] = val
                        menu.setElement(6, 'value', a)
                        --menu.refresh()
                        break
                    end
                end
            end, function(data2, menu2)
                menu2.close()
                menu.refresh()
            end)
        elseif data.current.index == 'create' then
            local eventData = {}
            for k,v in pairs(data.elements) do
                if v.index ~= 'create' then
                    eventData[v.index] = v.value
                end
            end
            TriggerServerEvent('id_gangsystem:admin:createGang', eventData, serverEventCode)
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end

RegisterCommand('admin:editgang', function(src, args)
    ESX.TriggerServerCallback('id_gangsystem:admin:getAccess', function(hasAccess) 
        if hasAccess then
            if args[1] then
                local name = args[1]
                editGang(name)
            end
        end
    end, Config.Admin.perms.editGang)
end, false)
TriggerEvent('chat:addSuggestion', '/admin:editgang', 'Rediger en bande', {{ name="navn", help="Servernavn på banden" }})

function editGang(name)
    ESX.UI.Menu.CloseAll()

    ESX.TriggerServerCallback('id_gangsystem:gang:getGang', function(gangData)
        if not gangData then
            exports['id_notify']:notify({
                message = _U('admin:editGang:noGang', name),
                type = 'error'
            })
            return
        end


        local elements = {
            {label = _U('admin:editGang:menu::label', gangData.label)},
            {label = _U('admin:createGang:menu::money', ESX.Math.GroupDigits(gangData.money)), index = 'money', value = gangData.money},
            {label = _U('admin:createGang:menu::maxMembers', gangData.maxMembers), index = 'maxMembers', value = gangData.maxMembers},
            {label = _U('admin:createGang:menu::maxPushers', gangData.maxPushers), index = 'maxPushers', value = gangData.maxPushers},
            {label = _U('admin:editGang:menu::save'), index = 'save'},
            {label = _U('admin:editGang:menu::remove'), index = 'remove'},
        }

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'admin_editGang', {
            title = _U('admin:editGang:menu::title'),
            align = 'left',
            elements = elements
        }, function(data, menu)
            if data.current.index == 'money' then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_money', {
                    title = _U('amount')
                }, function(data2, menu2)
                    if data2.value == 'nil' then data2.value = 0 end
    
                    if data2.value and tonumber(data2.value) then
                        local val = tonumber(data2.value)
                        menu2.close()
                        menu.setElement(2, 'label', _U('admin:createGang:menu::money', ESX.Math.GroupDigits(val)))
                        menu.setElement(2, 'value', val)
                        gangData.money = val
                        menu.refresh()
                    end
                end,function(data2, menu2)
                    menu2.close()
                end)
            elseif data.current.index == 'maxMembers' then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_members', {
                    title = _U('amount')
                }, function(data2, menu2)
                    if data2.value and tonumber(data2.value) then
                        local val = tonumber(data2.value)
                        menu2.close()
                        menu.setElement(3, 'label', _U('admin:createGang:menu::maxMembers', val))
                        menu.setElement(3, 'value', val)
                        gangData.maxMembers = val
                        menu.refresh()
                    end
                end,function(data2, menu2)
                    menu2.close()
                end)
            elseif data.current.index == 'maxPushers' then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_pushers', {
                    title = _U('amount')
                }, function(data2, menu2)
                    if data2.value and tonumber(data2.value) then
                        local val = tonumber(data2.value)
                        menu2.close()
                        menu.setElement(4, 'label', _U('admin:createGang:menu::maxPushers', val))
                        menu.setElement(4, 'value', val)
                        gangData.maxPushers = val
                        menu.refresh()
                    end
                end,function(data2, menu2)
                    menu2.close()
                end)
            elseif data.current.index == 'save' then
                menu.close()
                TriggerServerEvent('id_gangsystem:admin:updateGang', gangData, serverEventCode)
            elseif data.current.index == 'remove' then
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'admin_confirm_delete', {
                    title = _U('admin:editGang:menu::confirmDelete', gangData.label),
                    align = 'center',
                    elements = {
                        {label = _U('no'), value = 'no'},
                        {label = _U('yes'), value = 'yes'}
                }}, function(data2, menu2)
                    menu2.close()
                    if data2.current.value == 'yes' then
                        menu.close()
                        TriggerServerEvent('id_gangsystem:admin:deleteGang', gangData, serverEventCode)
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)
            end
        end, function(data, menu)
            menu.close()
        end)
    end, name)
end

--================
--==    Gang    ==
--================
Citizen.CreateThread(function()
    while true do
        local sleep = 1000

        if GangData and GangData.name then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for k,v in pairs(GangData.data.locations) do
                local coords = vector3(v.x, v.y, v.z)
                if GetDistanceBetweenCoords(playerCoords, coords, false) <= Config.DrawDistance then
                    sleep = 1
                    local markerData = Config.Markers[k]

                    DrawMarker(markerData.type, coords,
                    0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                    markerData.scale,
                    markerData.rgba[1], markerData.rgba[2], markerData.rgba[3], markerData.rgba[4],
                    markerData.bobUpAndDown, markerData.faceCamera, 2, markerData.rotate, nil, nil, false)

                    if markerData.underCircle then
                        DrawMarker(25, coords + vector3(0.0, 0.0, -1.0),
                        0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                        1.0, 1.0, 1.0,
                        markerData.rgba[1], markerData.rgba[2], markerData.rgba[3], markerData.rgba[4],
                        false, false, 2, false, nil, nil, false)
                    end

                    if Exports.hasPlayerPerm(markerData.perm) then
                        if GetDistanceBetweenCoords(playerCoords, coords) <= markerData.scale.x then
                            inMarker = k
                            if showPromp then exports['id_helpnotify']:showUI(_U('gang:menu:'..k..'::promp')) end
                            if IsControlJustPressed(0, 51) then
                                showPromp = false
                                exports['id_helpnotify']:hideUI()
                                openGangMenu(k)
                            end
                        elseif inMarker == k then
                            inMarker = false
                            showPromp = true
                            exports['id_helpnotify']:hideUI()
                            ESX.UI.Menu.CloseAll()
                        end
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

function openGangMenu(menu)
    ESX.UI.Menu.CloseAll()

    if menu == 'actionMenu' then
        openActionMenu()
    elseif menu == 'money' then
        openMoneyMenu()
    else
        showPromp = true
    end
end

function openActionMenu()
    ESX.TriggerServerCallback('id_gangsystem:gang:getGang', function(gangData)
        local elements = {}
        
        if Exports.hasPlayerPerm('actionMenu.info') then
            table.insert(elements, {label = _U('gang:menu:actionMenu::gangInfo'), value = 'gang_info'})
        end

        if Exports.hasPlayerPerm('members.add') then
            table.insert(elements, {label = _U('gang:menu:actionMenu::memberAdd'), value = 'member_add'})
        end

        if Exports.hasPlayerPerm('members.list') then
            table.insert(elements, {label = _U('gang:menu:actionMenu::memberList'), value = 'member_list'})
        end

        if Exports.hasPlayerPerm('ranks.add') then
            table.insert(elements, {label = _U('gang:menu:actionMenu::rankAdd'), value = 'rank_add'})
        end

        if Exports.hasPlayerPerm('ranks.list') then
            table.insert(elements, {label = _U('gang:menu:actionMenu::rankList'), value = 'rank_list'})
        end

        if #elements == 0 then
            table.insert(elements, {label = _U('gang:menu:actionMenu::noElements')})
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_actionMenu', {
            title = _U('gang:menu:actionMenu::title', gangData.label),
            align = 'left',
            elements = elements
        }, function(data, menu)
            if data.current.value == 'gang_info' then
                menu.close()
                openGangInfoMenu()
            elseif data.current.value == 'member_add' then
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local closestPlayers = ESX.Game.GetPlayersInArea(playerCoords, 3.0)
                local elements2 = {{label = _U('find_id')}}

                for k,v in ipairs(closestPlayers) do
                    if v ~= PlayerId() then
                        table.insert(elements2, {
                            label = 'ID: '..GetPlayerServerId(v),
                            id = v,
                            serverId = GetPlayerServerId(v)
                        })
                    end
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_actionMenu_memberAdd', {
                    title = _U('gang:menu:actionMenu:memberAdd::title'),
                    align = 'left',
                    elements = elements2
                }, function(data2, menu2)
                    if data2.current.serverId then
                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_actionMenu_memberAdd_select', {
                            title = _U('gang:menu:actionMenu:memberAdd:selectRank:title'),
                            align = 'left',
                            elements = {
                                {label = _U('gang:menu:actionMenu:memberAdd:selectRank::member'), type = 'member'},
                                {label = _U('gang:menu:actionMenu:memberAdd:selectRank::pusher'), type = 'pusher'},
                        }}, function(data3, menu3)
                            menu3.close()
                            menu2.close()
                            TriggerServerEvent('id_gangsystem:gang:memberAdd', gangData.name, data2.current.serverId, data3.current.type, serverEventCode)
                        end, function(data3, menu3)
                            menu3.close()
                        end)
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)
            elseif data.current.value == 'member_list' then
                menu.close()
                openMemberList(gangData)
            elseif data.current.value == 'rank_add' then
                menu.close()
                createNewRank(gangData)
            elseif data.current.value == 'rank_list' then
                menu.close()
                openRankList(gangData)
            end
        end, function(data, menu)
            menu.close()
            showPromp = true
        end)
    end, GangData.name)
end

function openGangInfoMenu()
    ESX.TriggerServerCallback('id_gangsystem:gang:getGangInfo', function(gangInfo)
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_actionMenu_gangInfo', {
            title = _U('gang:menu:actionMenu:gangInfo::title'),
            align = 'left',
            elements = {
                {label = _U('gang:menu:actionMenu:gangInfo::label', gangInfo.label)},
                {label = _U('gang:menu:actionMenu:gangInfo::members', gangInfo.members, gangInfo.maxMembers)},
                {label = _U('gang:menu:actionMenu:gangInfo::pushers', gangInfo.pushers, gangInfo.maxPushers)},
        }}, function(data, menu) end, function(data, menu)
            menu.close()
            openActionMenu()
        end)
    end, GangData.name)
end

function openMemberList(gangData)
    ESX.TriggerServerCallback('id_gangsystem:gang:getGangMembers', function(gangMembers)
        if gangMembers then
            local elements = {
                head = {_U('gang:menu:actionMenu:memberList::name'), _U('gang:menu:actionMenu:memberList::rank'), _U('gang:menu:actionMenu:memberList::online'), _U('gang:menu:actionMenu:memberList::actions')},
                rows = {}
            }

            local actionButtons = ''

            if Exports.hasPlayerPerm('members.promote') then
                actionButtons = actionButtons..'{{'.._U('gang:menu:actionMenu:memberList:action::promote')..'|promote}} '
            end

            if Exports.hasPlayerPerm('members.remove') then
                actionButtons = actionButtons..'{{'.._U('gang:menu:actionMenu:memberList:action::remove')..'|remove}}'
            end

            for k,v in pairs(gangMembers) do
                table.insert(elements.rows, {
                    data = v,
                    cols = {
                        v.name,
                        v.rankLabel,
                        v.online,
                        actionButtons
                    }
                })
            end

            ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'gang_actionMenu_memberList', elements, function(data, menu)
                if data.data.identifier ~= ESX.PlayerData.identifier then
                    if GangData.rankId < data.data.rankId then
                        if data.value == 'promote' then
                            menu.close()
                            local elements2 = {}

                            for k,v in pairs(gangData.ranks) do
                                if v.id > GangData.rankId then
                                    table.insert(elements2, {
                                        label = v.label,
                                        value = v.name
                                    })
                                end
                            end

                            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_actionMenu_memberList_promote', {
                                title = _U('gang:menu:actionMenu:memberList:action:promote::selectRank'),
                                align = 'left',
                                elements = elements2
                            }, function(data2, menu2)
                                TriggerServerEvent('id_gangsystem:gang:setGangRank', gangData.name, data2.current, data.data, serverEventCode)
                                menu2.close()
                            end, function(data2, menu2)
                                menu2.close()
                                openMemberList(gangData)
                            end)
                        elseif data.value == 'remove' then
                            TriggerServerEvent('id_gangsystem:gang:removeMember', gangData.name, data.data, serverEventCode)
                            menu.close()
                        end
                    else
                        exports['id_notify']:notify({
                            message = _U('gang:menu:actionMenu:memberList:action::ownRank'),
                            type = 'error'
                        })
                    end
                else
                    exports['id_notify']:notify({
                        message = _U('gang:menu:actionMenu:memberList:action::yourSelf'),
                        type = 'error'
                    })
                end
            end, function(data, menu)
                menu.close()
                showPromp = true
            end)
        end
    end, gangData.name)
end

function createNewRank(gangData)
    local newRank = {
        name = 'new_rank',
        label = 'Ny Rank',
        perms = {},
        id = 0
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_actionMenu_rankAdd', {
        title = _U('gang:menu:actionMenu:rankAdd::title'),
        align = 'left',
        elements = {
            {label = _U('gang:menu:actionMenu:rankAdd::label', newRank.label), index = 'label', value = newRank.label},
            {label = _U('gang:menu:actionMenu:rankAdd::perms'), index = 'perms', value = newRank.perms},
            {label = _U('gang:menu:actionMenu:rankAdd::save'), index = 'save'}
    }}, function(data, menu)
        if data.current.index == 'label' then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'gang_actionMenu_rankAdd_label', {
                title = _U('gang:menu:actionMenu:rankAdd:label::edit')
            }, function(data2, menu2)
                menu2.close()
                newRank.label = data2.value
                newRank.name = data2.value:gsub(' ', '_'):lower():gsub('ø', 'oe'):gsub('æ', 'ae'):gsub('å', 'aa')
                menu.setElement(1, 'label', _U('gang:menu:actionMenu:rankAdd::label', newRank.label))
                menu.setElement(1, 'value', newRank.label)
                menu.refresh()
            end, function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.index == 'perms' then
            local elements2 = {}

            for k,v in pairs(Config.Gang.permList) do
                table.insert(elements2, {
                    label = k,
                    value = k,
                    data = v
                })
            end

            table.insert(elements2, {
                label = _U('gang:menu:actionMenu:rankList:action:perms:edit::savePerms'),
                action = 'save'
            })

            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_actionMenu_rankList_perms', {
                title = _U('gang:menu:actionMenu:rankList:action:perms:edit::title', newRank.label),
                align = 'left',
                elements = elements2
            }, function(data2, menu2)
                if data2.current.value then
                    local elements3 = {}
                    local i = 1

                    for k,v in pairs(data2.current.data) do
                        table.insert(elements3, {
                            label = '<span style="color: rgb(224, 50, 50);">'..v..'</span>',
                            value = v,
                            access = false,
                            index = i
                        })
                        i = i + 1
                    end

                    for k,v in pairs(elements3) do
                        for k2,v2 in pairs(newRank.perms) do
                            if data2.current.value..'.'..v.value == v2 then
                                v.access = true
                                v.label = '<span style="color: rgb(114, 204, 114);">'..v.value..'</span>'
                            end
                        end
                    end

                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_actionMenu_rankList_perms_edit', {
                        title = data2.current.value,
                        align = 'left',
                        elements = elements3
                    }, function(data3, menu3)
                        for k,v in pairs(menu3.data.elements) do
                            if v.index == data3.current.index then
                                v.access = not v.access
                                local perm = data2.current.value..'.'..v.value
                                if v.access then
                                    menu3.setElement(k, 'label', '<span style="color: rgb(114, 204, 114);">'..v.value..'</span>')
                                    table.insert(newRank.perms, perm)
                                else
                                    menu3.setElement(k, 'label', '<span style="color: rgb(224, 50, 50);">'..v.value..'</span>')
                                    for k,v in pairs(newRank.perms) do
                                        if v == perm then
                                            table.remove(newRank.perms, k)
                                            break
                                        end
                                    end
                                end
                                menu3.setElement(k, 'access', v.access)
                                menu3.refresh()
                            end
                        end
                    end, function(data3, menu3)
                        menu3.close()
                    end)
                elseif data2.current.action == 'save' then
                    menu2.close()
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.index == 'save' then
            menu.close()
            TriggerServerEvent('id_gangsystem:gang:rankAdd', gangData.name, newRank, serverEventCode)
        end
    end, function(data, menu)
        menu.close()
        openActionMenu()
    end)
end

function openRankList(gangData)
    local elements = {
        head = {_U('gang:menu:actionMenu:rankList::id'), _U('gang:menu:actionMenu:rankList::label'), _U('gang:menu:actionMenu:rankList::name'), _U('gang:menu:actionMenu:rankList::perms'), _U('gang:menu:actionMenu:rankList::actions')},
        rows = {}
    }

    local actionButtons = ''

    if Exports.hasPlayerPerm('ranks.remove') then
        actionButtons = actionButtons..'{{'.._U('gang:menu:actionMenu:rankList:action::remove')..'|remove}} <br>'
    end

    if Exports.hasPlayerPerm('ranks.perms') then
        actionButtons = actionButtons..'{{'.._U('gang:menu:actionMenu:rankList:action::perms')..'|perms}} <br>'
    end

    if Exports.hasPlayerPerm('ranks.edit') then
        actionButtons = actionButtons..'{{'.._U('gang:menu:actionMenu:rankList:action::edit')..'|edit}}'
    end

    local ranks = {}
    for i=1, #gangData.ranks, 1 do
        for k,v in pairs(gangData.ranks) do
            if v.id == i then
                table.insert(ranks, v)
            end
        end
    end

    for k,v in pairs(ranks) do
        local perms = ''
        for k2,v2 in pairs(v.perms) do
            perms = perms..v2..'<br>'
        end

        table.insert(elements.rows, {
            data = v,
            cols = {
                v.id,
                v.label,
                v.name,
                perms,
                actionButtons
            }
        })
    end

    ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'gang_actionMenu_rankList', elements, function(data, menu)
        if data.data.id > GangData.rankId or GangData.rankId == 1 then
            if data.value == 'remove' then
                if data.data.id == 1 or data.data.id == #elements.rows or data.data.id == #elements.rows - 1 then
                    exports['id_notify']:notify({
                        message = _U('gang:menu:actionMenu:rankList:action:remove::noRem', data.data.label),
                        type = 'error'
                    })
                else
                    menu.close()
                    TriggerServerEvent('id_gangsystem:gang:removeRank', gangData.name, data.data.name, serverEventCode)
                end
            elseif data.value == 'perms' then
                if data.data.id == 1 then
                    exports['id_notify']:notify({
                        message = _U('gang:menu:actionMenu:rankList:action:perms::noEdit', data.data.label),
                        type = 'error'
                    })
                else
                    menu.close()
                    local elements2 = {}

                    for k,v in pairs(Config.Gang.permList) do
                        table.insert(elements2, {
                            label = k,
                            value = k,
                            data = v
                        })
                    end

                    table.insert(elements2, {
                        label = _U('gang:menu:actionMenu:rankList:action:perms:edit::savePerms'),
                        action = 'save'
                    })

                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_actionMenu_rankList_perms', {
                        title = _U('gang:menu:actionMenu:rankList:action:perms:edit::title', data.data.label),
                        align = 'left',
                        elements = elements2
                    }, function(data2, menu2)
                        if data2.current.value then
                            local elements3 = {}
                            local i = 1

                            for k,v in pairs(data2.current.data) do
                                table.insert(elements3, {
                                    label = '<span style="color: rgb(224, 50, 50);">'..v..'</span>',
                                    value = v,
                                    access = false,
                                    index = i
                                })
                                i = i + 1
                            end

                            for k,v in pairs(elements3) do
                                for k2,v2 in pairs(data.data.perms) do
                                    if data2.current.value..'.'..v.value == v2 then
                                        v.access = true
                                        v.label = '<span style="color: rgb(114, 204, 114);">'..v.value..'</span>'
                                    end
                                end
                            end
    
                            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_actionMenu_rankList_perms_edit', {
                                title = data2.current.value,
                                align = 'left',
                                elements = elements3
                            }, function(data3, menu3)
                                for k,v in pairs(menu3.data.elements) do
                                    if v.index == data3.current.index then
                                        v.access = not v.access
                                        local perm = data2.current.value..'.'..v.value
                                        if v.access then
                                            menu3.setElement(k, 'label', '<span style="color: rgb(114, 204, 114);">'..v.value..'</span>')
                                            table.insert(data.data.perms, perm)
                                        else
                                            menu3.setElement(k, 'label', '<span style="color: rgb(224, 50, 50);">'..v.value..'</span>')
                                            for k,v in pairs(data.data.perms) do
                                                if v == perm then
                                                    table.remove(data.data.perms, k)
                                                    break
                                                end
                                            end
                                        end
                                        menu3.setElement(k, 'access', v.access)
                                        menu3.refresh()
                                    end
                                end
                            end, function(data3, menu3)
                                menu3.close()
                            end)
                        elseif data2.current.action == 'save' then
                            menu2.close()
                            TriggerServerEvent('id_gangsystem:gang:editPerms', gangData.name, data.data.perms, data.data.name, serverEventCode)
                        end
                    end, function(data2, menu2)
                        menu2.close()
                        openRankList(gangData)
                    end)
                end
            elseif data.value == 'edit' then
                menu.close()
                local elements2 = {{label = _U('gang:menu:actionMenu:rankList:action:edit::label'), value = 'label'}}

                if data.data.id ~= 1 and data.data.id ~= #elements.rows and data.data.id ~= #elements.rows - 1 then
                    table.insert(elements2, {label = _U('gang:menu:actionMenu:rankList:action:edit::moveUp'), value = 'move_up'})
                    table.insert(elements2, {label = _U('gang:menu:actionMenu:rankList:action:edit::moveDown'), value = 'move_down'})
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_actionMenu_ranklist_edit', {
                    title = _U('gang:menu:actionMenu:rankList:action:edit::title', data.data.label),
                    align = 'left',
                    elements = elements2
                }, function(data2, menu2)
                    if data2.current.value == 'label' then
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'gang_actionMenu_rankList_edit_label', {
                            title = _U('gang:menu:actionMenu:rankList:action:edit::newLabel', data.data.label)
                        }, function(data3, menu3)
                            menu2.close()
                            menu3.close()
                            TriggerServerEvent('id_gangsystem:gang:editRank', gangData.name, data3.value, 'label', data.data.name, serverEventCode)
                        end, function(data3, menu3)
                            menu3.close()
                        end)
                    elseif data2.current.value == 'move_up' then
                        if data.data.id == 2 then
                            exports['id_notify']:notify({
                                message = _U('gang:menu:actionMenu:rankList:action:edit::atTop', data.data.label),
                                type = 'error'
                            })
                        else
                            menu2.close()
                            TriggerServerEvent('id_gangsystem:gang:editRank', gangData.name, data.data.id - 1, 'moveUp', data.data.name, serverEventCode)
                        end
                    elseif data2.current.value == 'move_down' then
                        if data.data.id == #elements.rows - 2 then
                            exports['id_notify']:notify({
                                message = _U('gang:menu:actionMenu:rankList:action:edit::atBottom', data.data.label),
                                type = 'error'
                            })
                        else
                            menu2.close()
                            TriggerServerEvent('id_gangsystem:gang:editRank', gangData.name, data.data.id + 1, 'moveDown', data.data.name, serverEventCode)
                        end
                    end
                end, function(data2, menu2)
                    menu2.close()
                    openRankList(gangData)
                end)
            end
        else
            exports['id_notify']:notify({
                message = _U('gang:menu:actionMenu:rankList:action::noPerm'),
                type = 'error'
            })
        end
    end, function(data, menu)
        menu.close()
        showPromp = true
    end)
end

function openMoneyMenu()
    ESX.TriggerServerCallback('id_gangsystem:gang:getGang', function(gangData)
        local elements = {
            {label = _U('gang:menu:money::account', ESX.Math.GroupDigits(gangData.money))}
        }

        if Exports.hasPlayerPerm('money.insert') then
            table.insert(elements, {
                label = _U('gang:menu:money::insert'),
                value = 'insert'
            })
        end

        if Exports.hasPlayerPerm('money.take') then
            table.insert(elements, {
                label = _U('gang:menu:money::take'),
                value = 'take'
            })
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_money_menu', {
            title = _U('gang:menu:money::title', gangData.label),
            align = 'left',
            elements = elements
        }, function(data, menu)
            if data.current.value == 'insert' then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'gang_money_insert', {
                    title = _U('amount')
                }, function(data2, menu2)
                    if data2.value and tonumber(data2.value) then
                        local num = tonumber(data2.value)
                        menu2.close()
                        ESX.TriggerServerCallback('id_gangsystem:gang:insertMoney', function(success)
                            if success then
                                menu.close()
                                exports['id_notify']:notify({
                                    message = _U('gang:menu:money::inserted', ESX.Math.GroupDigits(num)),
                                    type = 'custom',
                                    icon = 'fas fa-dollar-sign'
                                })
                                openMoneyMenu()
                            else
                                exports['id_notify']:notify({
                                    message = _U('not_enough_money', ESX.Math.GroupDigits(num)),
                                    type = 'error'
                                })
                            end
                        end, GangData.name, num)
                    else
                        exports['id_notify']:notify({
                            message = _U('not_number'),
                            type = 'error'
                        })
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)
            elseif data.current.value == 'take' then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'gang_money_take', {
                    title = _U('amount')
                }, function(data2, menu2)
                    if data2.value and tonumber(data2.value) then
                        local num = tonumber(data2.value)
                        menu2.close()
                        ESX.TriggerServerCallback('id_gangsystem:gang:takeMoney', function(success)
                            if success then
                                menu.close()
                                exports['id_notify']:notify({
                                    message = _U('gang:menu:money::taken', ESX.Math.GroupDigits(num)),
                                    type = 'custom',
                                    icon = 'fas fa-dollar-sign'
                                })
                                openMoneyMenu()
                            else
                                exports['id_notify']:notify({
                                    message = _U('gang:menu:money::noMoney', ESX.Math.GroupDigits(num)),
                                    type = 'error'
                                })
                            end
                        end, GangData.name, num)
                    else
                        exports['id_notify']:notify({
                            message = _U('not_number'),
                            type = 'error'
                        })
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)
            end
        end, function(data, menu)
            menu.close()
            showPromp = true
        end)
    end, GangData.name)
end

--================
--==    Shop    ==
--================
local npc
local FTMenu = false

if Config.Addons['fivem-target'] then
    function shopFTMenu()
        if npc and Exports.hasPlayerPerm('items.buy') and not FTMenu then
            createFTMenu(npc)
        elseif FTMenu and not Exports.hasPlayerPerm('items.buy') then
            deleteFTMenu()
        end
    end

    function createFTMenu(entId)
        if FTMenu then return end

        ESX.TriggerServerCallback('id_gangsystem:shop:getItems', function(items) 
            local options = {}
            local itemOptions

            for k,v in pairs(items) do
                table.insert(options, {
                    name = v.name,
                    label = _U('shop:menu::itemLabel', v.label, ESX.Math.GroupDigits(v.price))
                })
            end

            exports["fivem-target"]:AddTargetLocalEntity({
                name = "id_gangsystem:shop::npc",
                label = _U('shop:FT::title'),
                icon = "fas fa-shopping-bag",
                entId = entId,
                interactDist = 2.5,
                onInteract = function(targetName,optionName,vars,entityHit)
                    local item
                    for k,v in pairs(vars) do
                        if v.name == optionName then
                            item = v
                        end
                    end

                    if item.options.amount == -1 then
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'gang_shop_amount', {
                            title = _U('shop:buyItem::amount')
                        }, function(data2, menu2)
                            if data2.value and tonumber(data2.value) then
                                TriggerServerEvent('id_gangsystem:shop:buyItem', optionName, vars, tonumber(data2.value), serverEventCode)
                            else
                                exports['id_notify']:notify({
                                    message = _U('shop:buyItem::notNumber'),
                                    type = 'error'
                                })
                            end
                        end, function(data2, menu2)
                            menu2.close()
                        end)
                    else
                        TriggerServerEvent('id_gangsystem:shop:buyItem', optionName, vars, item.options.amount, serverEventCode)
                    end
                end,
                options = options,
                vars = items
            })
            FTMenu = true
        end)
    end

    function deleteFTMenu()
        exports['fivem-target']:RemoveTargetPoint('id_gangsystem:shop::npc')
        FTMenu = false
    end
else
    function openShopMenu()
        ESX.UI.Menu.CloseAll()

        ESX.TriggerServerCallback('id_gangsystem:shop:getItems', function(items)
            local elements = {}

            for k,v in pairs(items) do
                table.insert(elements, {
                    label = _U('shop:menu::itemLabel', v.label, ESX.Math.GroupDigits(v.price)),
                    value = v.name,
                    options = v.options
                })
            end

            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gang_shop', {
                title = _U('shop:menu::title'),
                align = 'left',
                elements = elements
            }, function(data, menu)
                if data.current.value then
                    if data.current.options.amount == -1 then
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'gang_shop_amount', {
                            title = _U('shop:buyItem::amount')
                        }, function(data2, menu2)
                            if data2.value and tonumber(data2.value) then
                                TriggerServerEvent('id_gangsystem:shop:buyItem', data.current.value, items, tonumber(data2.value), serverEventCode)
                            else
                                exports['id_notify']:notify({
                                    message = _U('shop:buyItem::notNumber'),
                                    type = 'error'
                                })
                            end
                        end, function(data2, menu2)
                            menu2.close()
                        end)
                    else
                        TriggerServerEvent('id_gangsystem:shop:buyItem', data.current.value, items, data.current.options.amount, serverEventCode)
                    end
                    menu.close()
                end
            end, function(data, menu)
                menu.close()
            end)
        end)
    end

    CreateThread(function()
        while true do
            local sleep = 1000
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local dist = GetDistanceBetweenCoords(playerCoords, Config.Shop.npc.pos, true)

            if dist <= 1.5 and GangData and Exports.hasPlayerPerm('items.buy') then
                sleep = 1
                Core.Utils:DrawText3Ds(playerCoords.x, playerCoords.y, playerCoords.z, _U('shop:menu::promp'))
                if IsControlJustPressed(0, 51) then
                    openShopMenu()
                end
            end

            Wait(sleep)
        end
    end)
end

function createNPC()
    local modelHash = GetHashKey(Config.Shop.npc.model)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Wait(10) end

    npc = CreatePed(4, modelHash, Config.Shop.npc.pos, Config.Shop.npc.heading, false, true)
    SetEntityHeading(npc, Config.Shop.npc.heading)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    RequestAnimDict(Config.Shop.npc.anim.dict)
    while not HasAnimDictLoaded(Config.Shop.npc.anim.dict) do Wait(10) end
    TaskPlayAnim(npc, Config.Shop.npc.anim.dict, Config.Shop.npc.anim.name, 2.0, 2.0, -1, 1, 0, false, false, false)
    SetModelAsNoLongerNeeded(modelHash)
    TriggerEvent('cb_esx_selldrugs:addBlacklistedPed', npc)
    if GangData and Config.Addons['fivem-target'] then shopFTMenu() end
end

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if not npcId and GetDistanceBetweenCoords(playerCoords, Config.Shop.npc.pos) <= 200 then
            createNPC()
            return
        end

        Wait(sleep)
    end
end)