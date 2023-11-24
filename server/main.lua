serverEventCode = '3a3Hc5hvBHU$fqsS$m8XW=v4m#--6P2kCGpnPvrPKAnZkmC6CGSsXJmPZEmbTS37GQKLmz6Fm_V^LT3&#BdDvzdbj_vg*9VBUJ-G=afVLkKybB^-nWKe*H?!J!$4D--PW?tS^&529@uFsM_Z+aQ%=tr6aBav4pHz2vmKF&Y#JQ$PPM4sc7ku?QL=hg^T?_WkU?2-%#6Dh?5Y2__?SAgMX#3ktnR!8JaMXV76f2U-Ukz8@_k!u-X3xzBD!T6jD36_&&Agu@+gA$gsTL84!SVVdyEpQtWfKYkR_f&%@uUSPqnc2n5cuDB%MYhzzayVxbb*hxM&H8!!m_Q!wNVqS9Q9am*qg*&!B3Q=QmQQ5Chnw72A3+B@HeMEqA4+33a?Y4KXQ$-rk=Mtecgm^z9&C$uMw+*vmVD3P-jM7-2q$^nMBMcb+ab_Mvn?_m#X-6jnsfxn9%yDtC$T_TyR_t**2U4Dct+hxH#z_T5mR6a3_M*3$#S8Yvg*!Ph8g64w4pzFDk65P5Cu#HmTzLrKYw^97+4ykv4ZrKZ6%r^k677KU@*g^q7-M@HVTZbcv$+NdyRF5C7HR3pztY%-77ukQ$p?FEg%aQT*zbfR!qR5$9WEEGmFLmTb8^MdgPX7npf=kvTCTn=YMm4HNGNE3Vx2Dvz+gb_uhjxvwJs@@Ew8V2sb^BFc*+EVd8A5+5Kx7jJ5RNqQJmSCWvT^PkeF55rEqsus?*dyC=XMRQ&FdWmk_zK*FQHbmY7ex_SGT@7Qyv4$uXA+@BvRHt5tGNt6cmy&tYB^!Z526*=ZP=+m532PbcQZ79h5h^fVjEgjPHJHME?8J6$NpjbdqU!xf%2BS3e9tdBr29-kQy@U_km5%N6LAzwZ&Lt%j^bd75zS62Vg6MBbE^3k&bCUD?p%tS!nhG+5XpDAtbDBEF-^x49#NGau_&!J7qdKFjzS4^HbZ4APYr$+MgN?8NCVmEcb5FBj3cbj=aBRjkGaY=qz6Bb#vHSPbLXBk6knn?8w$J-a?Bc-X8zz$+LCkaJUWyxG+?DBL*8n2_aN6Z%XJ&TNNt!5rRwBW!gyux=$UNZTdH@GCqKy2zT^*zjQtrHPZ?EYheHPs5FkU+AbnBWMRg9sE=bXwFXwNd&=_Ncb$csZhd!vewUg%kUUfEBCRd#jVzkm9UhvLn@&^w=_M9SXnx-Z*XXkHkp!GLPg^4rDQqWv-3SZeu*3!dpmrk-SJ+4dh!HveEyw_9ZNsrpuF*5#aQfuaYp2aDxr?*&Q&^+WgUH@%pmY6&s_Yj%RGg!L^4^ewJxmp$ph-*p=Y6s8RrW6CsMy^zEeMnp$rU2Y-mCFGEpB&*L*9_4_=N&zma@GF?bqN$-X*KdyFfnsu!*_3^2^Nbe3&rswzedm5%kBdfKpjAgsxr$C^pDp4S?yt6+N-Z!*#^39bpktAx$_Zu!Xd5&wW=WumPw3VQ!WBLC_=526AfPeJunZUgzxbLEnf9B5g$rRAqbhCj_35Es!_5A%^XTNt8qp6sMZkkvX74=J-?4h#L*6JDU!wM*dJdNDWr$xR*+qP%wvw2tnVMEmhW^VcAWL$FZupfn!WjY2J5Kxhr^y#Zh$e$9b-bu8GEHjAR%LK*r^rh9CUxHf#MT83Pg6g@RjRbArMbdgAS3F!BQ3Jze4V%G=M9E+Kebf*s!VwHvAV^Tt*Fgr_&&s+8daTauE_cF*qzkc*ddkMn^UBmB@tb!PsjkNDV?-xgP7FwR#jYTYB2uCa!qk*%wg#GXcMV=jCr5hB$GzBH-xp?kh22S%V-?5N94t5Nq^JKkw+@Bktnx6=RgVd+svZ^K8uyj7BJvf*!EXKeHG29?Xjp+8rV5V9-fgXCF5$KfRSbefc9a2x5gCA2r@VCmSSHzkdbw&wJt4h!%X-s9MW9HHCExdh-?DGYjVzU-H$QS-RY9ptE6eRMzKa5xz*3x^V^%9bm@r3RMJ$nqA=D2352CH2YxP7T$J%2s8y-UG*5Ku&NLhX#WHHP!%7FzxnY4*=@9BBGM_S5h_F%Gwf$%rK#k**9mNu6KNzRBvSAa=rEbY@FBAB=9gj3uc9!-v'

-- Scriptet kan kun bruges med ESX, da der er for meget UI til at gøre det standalone.
-- Lille check på om serveren bruger ESX, indtil jeg har lavet custom UI til scriptet.
if not _FRAMEWORK == 'ESX' then
    Core.Utils:Print('err', 'Dette script kan kun bruges med ESX!')
    StopResource(GetCurrentResourceName())
end

gangList = {}

Core:Ready(function()
    exports.oxmysql:query('SELECT * FROM id_gangs', {}, function(data)
        if data and data[1] then
            for k,v in pairs(data) do
                gangList[v.name] = {
                    name = v.name,
                    label = v.label,
                    money = v.money,
                    ranks = json.decode(v.ranks),
                    maxMembers = v.maxMembers,
                    maxPushers = v.maxPushers,
                    locations = json.decode(v.locations)
                }
            end
        end
    end)
end)

--================
--==    Logs    ==
--================
for k,v in pairs(Config.Logs) do
    if k ~= 'Colors' then
        local prefix = GetCurrentResourceName()..'::'..tostring(k):lower()

        if type(v) == 'table' then
            for k2,v2 in pairs(v) do
                Core.Logs:CreateLog(prefix..':'..tostring(k2):lower(), {
                    title = _('logs:'..tostring(k):lower()..'::'..tostring(k2):lower()..':title'),
                    webhook = v2,
                    color = Config.Logs.Colors[k]
                })
            end
        elseif type(v) == 'string' then
            Core.Logs:CreateLog(prefix, {
                title = _('logs::'..tostring(k):lower()..':title'),
                webhook = v,
                color = Config.Logs.Colors[k]
            })
        end
    end
end

--===================
--==    Exports    ==
--===================
Exports = {}

function Exports.getAllGangs()
    return gangList
end

function Exports.getGangByName(name)
    if gangList[name] then
        return gangList[name]
    end

    return nil
end

function Exports.getPlayerGang(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer then
        local data = exports.oxmysql:query_async('SELECT gang FROM users WHERE identifier = ?', {xPlayer.getIdentifier()})
        return Exports.getGangByName(data[1].gang)
    end

    return nil
end

function Exports.getPlayerGangRank(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer then
        local data = exports.oxmysql:query_async('SELECT gang, gang_rank FROM users WHERE identifier = ?', {xPlayer.getIdentifier()})
        if gangList[data[1].gang] then
            return data[1].gang, data[1].gang_rank
        end
    end

    return nil
end

function Exports.getPlayerGangPerms(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    local gang, rank = Exports.getPlayerGangRank(src)
    local perms = nil

    if gang and rank then
        for k,v in pairs(Exports.getGangByName(gang).ranks) do
            if v.name == rank then
                perms = v.perms
                break
            end
        end
    end

    return perms
end

function Exports.hasPlayerGangPerm(src, perm)
    local a,b = perm:find('%.')
    local starPerm = perm:sub(1, b-1)..'.*'

    for k,v in pairs(Exports.getPlayerGangPerms(src)) do
        if v == starPerm or v == perm then
            return true
        end
    end

    return false
end

function Exports.addGangMoney(name, amount)
    local gang = Exports.getGangByName(name)
    if gang then
        local newAmount = gang.money + amount
        exports.oxmysql:update('UPDATE id_gangs SET money = ? WHERE name = ?', {newAmount, gang.name}, function()
            gang.money = newAmount
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
    end
end

function Exports.takeGangMoney(name, amount)
    local gang = Exports.getGangByName(name)
    if gang then
        if gang.money >= amount then
            local newAmount = gang.money - amount
            exports.oxmysql:update('UPDATE id_gangs SET money = ? WHERE name = ?', {newAmount, gang.name}, function()
                gang.money = newAmount
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
        end
    end
end

exports('getAllGangs', Exports.getAllGangs)
exports('getGangByName', Exports.getGangByName)
exports('getPlayerGang', Exports.getPlayerGang)
exports('getPlayerGangRank', Exports.getPlayerGangRank)
exports('getPlayerGangPerms', Exports.getPlayerGangPerms)
exports('hasPlayerGangPerm', Exports.hasPlayerGangPerm)
exports('addGangMoney', Exports.addGangMoney)
exports('takeGangMoney', Exports.takeGangMoney)

--================
--==    Admin   ==
--================
function setGangBoss(src, target, gangName)
    local xPlayer = ESX.GetPlayerFromId(src)
    local zPlayer = ESX.GetPlayerFromId(target)
    local gang = Exports.getGangByName(gangName)

    if gang then
        exports.oxmysql:update('UPDATE users SET gang = ?, gang_rank = ? WHERE identifier = ?', {gang.name, 'boss', zPlayer.getIdentifier()}, function()
            TriggerClientEvent('id_notify:notify', src, {
                message = _U('admin:setGangBoss', zPlayer.getName(), GetPlayerName(target), gang.label),
                type = 'info'
            })
            updatePlayerGangData(target)
            Core.Logs:SendLog(GetCurrentResourceName()..'::admin:setboss', _('logs:admin::setboss', GetPlayerName(src), GetPlayerName(target), gang.label), {src, target})
        end)
    else
        TriggerClientEvent('id_notify:notify', src, {
            message = _U('admin:editGang:noGang', gangName),
            type = 'error'
        })
    end
end

RegisterCommand('admin:setgangboss', function(src, args)
    local xPlayer = ESX.GetPlayerFromId(src)
    local access = false

    for k,v in pairs(Config.Admin.perms.setGangBoss) do
        if xPlayer.getGroup() == v then
            access = true
            break
        end
    end

    if not access then return end

    local target = tonumber(args[1])
    local gangName = args[2]

    if target and gangName then
        setGangBoss(src, target, gangName)
    end
end, false)

ESX.RegisterServerCallback('id_gangsystem:admin:getAccess', function(src, cb, groups)
    local xPlayer = ESX.GetPlayerFromId(src)
    local access = false

    for k,v in pairs(groups) do
        if xPlayer.getGroup() == v then
            access = true
            break
        end
    end

    cb(access)
end)

--================
--==    Gang    ==
--================
function updatePlayerGangData(src)
    local gang, rank = Exports.getPlayerGangRank(src)
    local perms = Exports.getPlayerGangPerms(src)
    local rankId

    if gang and rank and perms then
        for k,v in pairs(Exports.getGangByName(gang).ranks) do
            if v.name == rank then
                rankId = v.id
                break
            end
        end

        TriggerClientEvent('id_gangsystem:gang:setGangData', src, {
            name = gang,
            rank = rank,
            rankId = rankId,
            perms = perms,
            data = Exports.getGangByName(gang)
        })
    else
        TriggerClientEvent('id_gangsystem:gang:setGangData', src, nil)
    end
end

AddEventHandler('esx:playerLoaded', updatePlayerGangData)

RegisterCommand('gangsystem:debug', function(src)
    updatePlayerGangData(src)    
end)

ESX.RegisterServerCallback('id_gangsystem:gang:getGang', function(src, cb, gangName)
    cb(Exports.getGangByName(gangName))
end)

ESX.RegisterServerCallback('id_gangsystem:gang:insertMoney', function(src, cb, gangName, amount)
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.getMoney() >= amount then
        Exports.addGangMoney(gangName, amount)
        xPlayer.removeMoney(amount)
        Core.Logs:SendLog(GetCurrentResourceName()..'::money:insert', _('logs:money::insert', xPlayer.getName(), Core.Utils.Math:GroupDigits(amount), Exports.getGangByName(gangName).label), src)
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('id_gangsystem:gang:takeMoney', function(src, cb, gangName, amount)
    local xPlayer = ESX.GetPlayerFromId(src)
    local gangData = Exports.getGangByName(gangName)

    if gangData.money >= amount then
        Exports.takeGangMoney(gangName, amount)
        xPlayer.addMoney(amount)
        Core.Logs:SendLog(GetCurrentResourceName()..'::money:take', _('logs:money::take', xPlayer.getName(), Core.Utils.Math:GroupDigits(amount), Exports.getGangByName(gangName).label), src)
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('id_gangsystem:gang:getGangInfo', function(src, cb, gangName)
    local gang = Exports.getGangByName(gangName)
    local members = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ? AND gang_rank != ?', {gangName, 'pusher'})
    local pushers = exports.oxmysql:query_async('SELECT * FROM users WHERE gang = ? AND gang_rank = ?', {gangName, 'pusher'})

    gang.members = #members
    gang.pushers = #pushers

    cb(gang)
end)

ESX.RegisterServerCallback('id_gangsystem:gang:getGangMembers', function(src, cb, gangName)
    local xPlayer = ESX.GetPlayerFromId(src)
    local gang = Exports.getGangByName(gangName)

    exports.oxmysql:query('SELECT * FROM users WHERE gang = ?', {gangName}, function(data)
        if data and data[1] then
            local members = {}

            for k,v in pairs(data) do
                local zPlayer = ESX.GetPlayerFromIdentifier(v.identifier)
                local rankLabel, rankId

                for k2,v2 in pairs(gang.ranks) do
                    if v2.name == v.gang_rank then
                        rankLabel = v2.label
                        rankId = v2.id
                        break
                    end
                end

                table.insert(members, {
                    name = v.firstname..' '..v.lastname,
                    identifier = v.identifier,
                    rank = v.gang_rank,
                    rankLabel = rankLabel,
                    rankId = rankId,
                    online = (zPlayer and _U('yes') or _U('no'))
                })
            end

            cb(members)
        else
            cb(nil)
        end
    end)
end)

--================
--==    Shop    ==
--================
ESX.RegisterServerCallback('id_gangsystem:shop:getItems', function(src, cb)
    local xPlayer = ESX.GetPlayerFromId(src)
    local gang = Exports.getPlayerGang(src)
    local items = {}

    for k,v in ipairs(Config.Shop.items) do
        local itemName = v.name:gsub('{name}', gang.name)
        local xItem = xPlayer.getInventoryItem(itemName)
        
        if xItem then
            table.insert(items, {
                label = xItem.label,
                name = xItem.name,
                price = v.price,
                options = v
            })

        end
    end

    cb(items)
end)