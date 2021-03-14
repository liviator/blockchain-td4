pragma solidity >= 0.6.0 < 0.8.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";




contract JonathanCoinPulv is ERC20 {
/* Creation de l'admin et de la whitelist (mapping des allowed user)
*/
    mapping(address => uint8) public Whitelist;
    address internal founder;
/*Creation du token ERC20 
*/
    string public  name_ = "JonathanCoinPulv";
    string public symbol_ = "JCP";
    uint public i_supply = 120000000000000;



    constructor() ERC20(name_,symbol_) public {
        founder = msg.sender;
        _mint(msg.sender, i_supply);
    }



/* Fonction de l'ERC20 */



/*Fonction finale get token (envoi en fonction du montant de la transaction, du rang dans la whiteliste, et de la présence dans la whitelist,
Pour des raisons de test l'utilisateur reste dans la white list afin d'éviter de devoir le rajouter à chaque fois mais on peut l'enlever après chaque
get token via Whitelist[msg.sender] == 0)
*/
    function getToken() payable public {
        require(Whitelist[msg.sender]!= 0);
        if(Whitelist[msg.sender] == 1)
        {
            _transfer(founder, msg.sender, msg.value * 100);
        }
        if(Whitelist[msg.sender] == 2)
        {
             _transfer(founder, msg.sender, msg.value * 200);
        }
        if(Whitelist[msg.sender] == 3)
        {
             _transfer(founder, msg.sender, msg.value * 300);
        }

    }
/* Ajout des adresses précisé dans la whitelist par l'admin
*/
    function set_whitelist(address account, uint8 rank) public
    {
        require(founder == msg.sender);
        require(rank > 0 && rank <4);
        Whitelist[account] = rank;
    }

/* Fonction qui permet a l'admin de mint des token a une adresse précise
*/

    function mint(address account, uint256 amount) public {
        require(founder == msg.sender);
        _mint(account, amount);   
    }



}