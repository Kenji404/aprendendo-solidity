pragma solidity >= 0.5.0 <0.6.0;

contract ZombieFactory {

    // definindo um evento a ser disparado com o emit, para avisar o front
    event NewZombie(uint zombieId, string name, uint dna);

    // definindo as variáveis
    uint dnaDigits = 16; // standard uint === uint256
    uint dnaModulus = 10 ** dnaDigits;

    // criando uma struct
    struct Zombie {
        string name;
        uint dna;
    }
    
    // criando um array de structs
    Zombie[] public zombies;

    // definindo mappings
    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;

    // criando zumbis
    function _createZombie (string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;

        // usando o msg.sender para dar a posse do zumbi ID para o endereço
        // chamador do contrato e incrementando a contagem de zumbis de cada
        // endereço.
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;

        // emit: avisando o front-end que houve uma inserção no array
        emit NewZombie(zombieId, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}