# programmation_blockchain_td4

## Install Truffle & create a truffle project:

Pour installer truffle, ouvrir un terminal et entrer la commande:  
`npm install -g truffle`  
-g l'installera globalement pour utiliser truffle de n'importe où.

Pour créer un projet avec truffle entrer:  
`truffle init`

## Create an ERC20 token contract & implement all ERC20 functions

Ouvrir un terminal à l'emplacement du projet truffle et entrer:  
`openzeppelin-solidity`

Aller dans **\node_modules\openzeppelin-solidity\contracts\token\ERC20** copier **ERC20.sol** dans **\contracts**, changer le path des import vers
**.\node_modules\openzeppelin-solidity\contracts\\*** et remplir manuellement les variables *_name*, *_symbol*, *_decimals* et *_totalSupply*.

## Create a migration to deploy your contract(s)

Créer **2_deploy_contracts.js** dans **\migration\\** et ajouter le code correspondant (voir projet).

Dans le terminal de votre projet entrer:  
`truffle develop`  
`compile`  
*Si le compile provoque une erreur, la version de truffle utilisé n'est probablement pas la bonne. Dans ce cas, aller dans **\truffle-config.js**, décommenter et changer la version à celle correspondante dans compilers.*

Installer [Ganache](https://www.trufflesuite.com/ganache]), l'ouvrir et faire **quick start**.

Dans le terminal de votre projet entrer:  
`migrate`
