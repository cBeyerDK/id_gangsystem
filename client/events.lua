--================
--==    Admin   ==
--================
RegisterNetEvent('id_gangs:admin:createGang', createGang)
RegisterNetEvent('id_gangs:admin:editGang', editGang)

--================
--==    Gang    ==
--================
RegisterNetEvent('id_gangsystem:gang:setGangData', function(data)
    GangData = data
    ESX.UI.Menu.CloseAll()
    if Config.Addons['fivem-target'] then shopFTMenu() end
end)