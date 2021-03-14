By Henry FAURE-GEORS and Alexandre BAUCHET

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


## Fonction du programme

Concernant les fonctions basique de notre token ERC20, elles sont directement héritée depuis openzeppelin et n'ont pas besoin d'être à nouveau programmé, nous avons donc décidé de les laisser tels qu'elles étaient.

Nous avons effectué la fonction GetToken que nous avons directement complété avec les autres parties du td. Ainsi, nous créons lors du déploiement du smart contract un mapping adresse -> uint de façon à pouvoir associer aux adresses de nos utilateurs des rangs (1, 2 ou 3) leur permettant d'obtenir plus de token lors de l'appel de la fonction.
Nous sauvegardons également l'adresse ayant servis au déploiement que nous considererons comme étant l'adresse administrateur (permettant ainsi d'attribuer les rôles aux autres adresses de notre projet)

Ainsi, l'administrateur a deux fontions. D'une part il attribue le rang dans la white list, mais il permet également de générer via un mint des token pour une adresse spécifique (fonction airdrop).

Dans la fonction GetToken qui n'est utilisable que par les adresses ayant deja un rang, la quantité de token attribué dépends du rang mais également de la quantité d'ether envoyé au smart contract. Une bonne valeur pour tester l'efficacité du programme sans problème de supply sur ganache est de prendre la valeur 0.000000001 eth.

Enfin, nous n'avons malheureusement pas réussi à implémenter un déploiement sur Rinkeby
