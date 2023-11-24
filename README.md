██╗██████╗░███████╗███╗░░██╗████████╗██╗████████╗██╗░░░██╗  ░██████╗████████╗░█████╗░██████╗░███████╗
██║██╔══██╗██╔════╝████╗░██║╚══██╔══╝██║╚══██╔══╝╚██╗░██╔╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
██║██║░░██║█████╗░░██╔██╗██║░░░██║░░░██║░░░██║░░░░╚████╔╝░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
██║██║░░██║██╔══╝░░██║╚████║░░░██║░░░██║░░░██║░░░░░╚██╔╝░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
██║██████╔╝███████╗██║░╚███║░░░██║░░░██║░░░██║░░░░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
╚═╝╚═════╝░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░░╚═╝░░░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝

# Gang System
Giv dine spiller fuld kontrol over deres gangs med vores gangsystem.
Vi giver dine spiller adgang til selv at oprette roller i deres gangs.
OBS: ESX ONLY

Du kan ændre beskeder under `shared/langs/da.lua`
Du kan indstille scriptet efter dine behov i `config.lua`
Du kan ændre de forskellige funktioner der bliver brugt i scriptet i hhv. `shared/utils.lua`, `server/utils.lua` og `client/utils.lua`

# SQL
Alle `.sql` filer ligger under `SQL` mappen.
Kør alle filer under `SQL` mappen.

# Dependencies
Alle dependencies kan hentes på vores discord under "kunde"-kategorien.
  - id_core
  - id_notify
  - id_helpnotify
  - oxmysql
  - ESX Legacy

# Tilføjelser
  - fivem-target | Kan bruges til bande shoppen, i stedet for 3d-tekst
      [https://github.com/cBeyerDK/fivem-target/archive/refs/heads/main.zip]

# Admin Commands
- /admin:creategang [navn]
  Opret en ny bande. (Der må IKKE være mellemrum i navnet)
  Du skal huske og sætte både actionMenu og money locationer, da disse ikke kan flyttes efter de er blevet sat.

- /admin:editgang [navn]
  Rediger et gang der allerede findes.

- /admin:setgangboss [playerId] [navn]
  Sæt bossen af et gang.
  Denne command skal bruges efter du har lavet ganget, til at tilføje en boss af ganget.

# Exports
== SERVER ==
- exports['id_gangsystem']:getAllGangs()
  Retunere en liste med alle gangs

- exports['id_gangsystem']:getGangByName(navn)
  Retunere gangdata fra et gang

- exports['id_gangsystem']:getPlayerGang(playerId)
  Retunere gangdata fra spillerens gang
  Er spilleren ikke med i et gang, retunerer den nil

- exports['id_gangsystem']:getPlayerGangRank(playerId)
  Retunere navnet på spillerens gang og navnet på spillerns gang rank
  Er spilleren ikke med i et gang, retunerer den nil

- exports['id_gangsystem']:getPlayerGangPerms(playerId)
  Retunere alle spillerens gang perms
  Er spilleren ikke med i et gang, retunerer den nil

- exports['id_gangsystem']:hasPlayerGangPerm(playerId, perm)
  Kontrollerer om spilleren har en permission
  Retunere en boolean

- exports['id_gangsystem']:addGangMoney(navn, amount)
  Tilføjer penge til bande kassen

- exports['id_gangsystem']:takeGangMoney(navn, amount)
  Fjerner penge fra bande kassen

==  CLIENT  ==
- exports['id_gangsystem']:getGangData()
  Retunere gang data fra spillerens gang
  Er spilleren ikke med i et gang, retunerer den nil

- exports['id_gangsystem']:hasPlayerPerm(perm)
  Kontrollerer om spilleren har en permission
  Retunere en boolean

# Support
Er der ting i scriptet der ikke virker, så opret en ticket på vores discord: https://discord.gg/E4kMrhQRS3


Copyright(c) Identity Store 2022-2030