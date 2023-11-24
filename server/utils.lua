Utils = Utils or {}

function Utils:canCarryItem(src, itemName, count)
    local xPlayer = ESX.GetPlayerFromId(src)

    if _FVERSION == 1.1 or _FVERSION == 1.2 then
        local xItem = xPlayer.getInventoryItem(itemName)

        return xItem.limit == -1 or xItem.count + count <= xItem.limit
    elseif _FVERSION >= 1.6 then
        return xPlayer.canCarryItem(itemName, count)
    end
end