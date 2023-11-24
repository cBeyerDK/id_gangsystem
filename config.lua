Config = {}

--===================
--==    General    ==
--===================
--[[
    Distancen på hvor tæt på du skal være på en marker før den vises
    OBS: Skal være et decimal tal
    f.eks 25.0 - for 25
]]
Config.DrawDistance = 25.0

--================
--==    Logs    ==
--================
Config.Logs = {}

--[[
    Den farve der skal være på discord embed, ud fra log kategori
    OBS: Det skal være en HEX farve kode
    Liste over forskellige farver:
        Farve       Hex Code
        Rød         #F44336
        Grøn	    #4CAF50
        Gul 	    #FFEB3B
        Blå 	    #42A5F5
        Lyse Blå	#03A9F4
        Lilla	    #9C27B0
        Hvid	    #F0F0F0
        Orange	    #FF5722
        Grå 	    #9E9E9E
]]
Config.Logs.Colors = {
    Admin = '#F44336',
    Money = '#4CAF50',
    Gang = '#FFEB3B',
    Shop = '#FFEB3B'
}

--[[
    Discord logs
    Indsæet weebhook URL til de forskellige logs, for at de virker
    Det samme URL kan godt bruges til flere logs
]]

Config.Logs.Admin = {
    Create = 'WEBHOOK_URL',
    Edit = 'WEBHOOK_URL',
    Delete = 'WEBHOOK_URL',
    SetBoss = 'WEBHOOK_URL'
}

Config.Logs.Money = {
    Insert = 'WEBHOOK_URL',
    Take = 'WEBHOOK_URL'
}

Config.Logs.Gang = {
    AddMember = 'WEBHOOK_URL',
    RemoveMember = 'WEBHOOK_URL',
}

Config.Logs.Shop = {
    BuyItem = 'WEBHOOK_URL'
}

--==================
--==    Addons    ==
--==================
--[[
    Angiv om du bruger de forskellige tilføjelser
        false = bruges ikke
        true = bruges
]]
Config.Addons = {
    ['fivem-target'] = false,
}

--================
--==    Gang    ==
--================
Config.Gang = {}

--[[
Permission List:
    money.see, money.take, money.insert
    members.add, members.remove, members.promote, members.list
    ranks.add, ranks.remove, ranks.perms, ranks.list
    items.buy
    actionMenu.open, actionMenu.info
    
Hvis du tilføjer `.*` til en perm gruppe, har du adgang til alle ting i den gruppe.
F.eks. `money.*` giver adgang til alle money ting.
]]
Config.Gang.permList = {
    ['money'] = {'*', 'see', 'take', 'insert'},
    ['members'] = {'*', 'add', 'remove', 'promote', 'list'},
    ['ranks'] = {'*', 'add', 'remove', 'perms', 'list', 'edit'},
    ['items'] = {'*', 'buy'},
    ['actionMenu'] = {'*', 'open', 'info'},
}

-- Standard permission levels for ranks
Config.Gang.defaultPerms = {
    boss = {
        'money.*',
        'members.*',
        'ranks.*',
        'items.*',
        'actionMenu.*'
    },
    underboss = {
        'money.see',
        'money.insert',
        'members.*',
        'ranks.perms',
        'ranks.list',
        'items.buy',
        'actionMenu.open'
    },
    accountant = {
        'money.see',
        'money.insert',
        'members.list',
        'actionMenu.open'
    },
    hr = {
        'money.see',
        'members.add',
        'members.remove',
        'members.list',
        'actionMenu.open'
    },
    member = {
        'money.see',
        'members.list',
        'actionMenu.open'
    },
    pusher = {
        'money.see',
        'members.list',
        'actionMenu.open'
    }
}

--[[
    Default gang settings
    OBS: Ranksne `boss`, `trial_member` og `pusher` SKAL eksistere ellers virker scriptet ikke!
]]
Config.Gang.default = {
    ranks = {
        {name = 'boss', label = 'Boss', permLevel = 'boss'},
        {name = 'under_boss', label = 'Under Boss', permLevel = 'underboss'},
        {name = 'accountant', label = 'Penge Holder', permLevel = 'accountant'},
        {name = 'hr', label = 'Human Resources', permLevel = 'hr'},
        {name = 'member', label = 'Medlem', permLevel = 'member'},
        {name = 'trial_member', label = 'Prøve Medlem', permLevel = 'member'},
        {name = 'pusher', label = 'Skubber', permLevel = 'pusher'},
    },
    money = 0,
    maxMembers = 10,
    maxPushers = 2,
    locations = {
        actionMenu = 'none',
        money = 'none'
    }
}

--====================
--==    Markers     ==
--====================
Config.Markers = {}

Config.Markers.actionMenu = {
    type = 30,
    scale = vector3(0.4, 0.5, 0.4),
    rgba = {224, 50, 50, 200},
    bobUpAndDown = false,
    faceCamera = true,
    rotate = false,
    perm = 'actionMenu.open'
}

Config.Markers.money = {
    type = 29,
    scale = vector3(0.6, 0.6, 0.6),
    rgba = {224, 50, 50, 200},
    bobUpAndDown = false,
    faceCamera = false,
    rotate = true,
    underCircle = true,
    perm = 'money.see'
}

--================
--==    Admin   ==
--================
Config.Admin = {}

-- Grupper der har adgang til de forskellige commands
Config.Admin.perms = {
    createGang = {'admin'}, 
    editGang = {'admin'},
    setGangBoss = {'admin'},
}

--================
--==    Shop    ==
--================
Config.Shop = {}

Config.Shop.npc = {
    model = 'a_m_y_smartcaspat_01',
    pos = vector3(967.83, -1829.09, 30.24),
    heading = 348.97,
    anim = {dict = 'anim@amb@nightclub@peds@', name = 'rcmme_amanda1_stand_loop_cop'}
}

--[[
    Shop Items
    [name]: Navnet på itemmet
        Hvis du putter {name} i itemName så vil den replace det med bandens navn.
    [price]: Prisen på tingen
    [amount]: Det antal man køber ad gangen
        Sætter du den til `-1` - vælger spilleren selv beløbet
    <[perm]>: Bestemt permission man skal have for at købe itemmet.

    <> = Valgfrit
]]
Config.Shop.items = {
    {name = 'keys_gang_{name}', price = 1400, amount = 1, perm = 'items.*'},
    {name = 'gang_phone_{name}', price = 5600, amount = 1},
    {name = 'weed_seed', price = 400, amount = -1},
    {name = 'coke_seed', price = 400, amount = -1},
    {name = 'heroin_seed', price = 400, amount = -1},
}
