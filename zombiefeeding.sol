pragma solidity >= 0.5.0 <0.6.0;

// Importa o contrato (Cap.21)
import "./zombiefactory.sol";

// Define ZombieFeeding pertencendo ao contrato ZombieFactory
// por herança (Cap.20)
contract ZombieFeeding is ZombieFactory {

  function feedAndMultiply(uint _zombieId, uint _targetDna) public {
      require(msg.sender == zombieToOwner[_zombieId]);
      // se o chamador da função (msg.sender) é o dono do Zumbi, prossegue. Caso contrário a função é finalizada

      Zombie storage myZombie = zombies[_zombieId];
  }
}