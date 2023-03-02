pragma solidity ^0.4.19;

import "./zombiefactory.sol";

contract KittyInterface {
    
    function getKitty(uint256 _id) external view returns (
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 siringWithId,
        uint256 birthTime,
        uint256 matronId,
        uint256 sireId,
        uint256 generation,
        uint256 genes
    );
}

contract ZombieFeeding is ZombieFactory {
    
    KittyInterface kittyContract;

    function setKittyContractAddress(address _address) external onlyOwner {
        kittyContract = KittyInterface(_address);
    }    
    
    function feedAndMultiply(uint _zombieId, uint _targetDna, string _species) public {
        require(msg.sender == zombieToOwner[_zombieId]);
        Zombie storage myZombie = zombies[_zombieId];
        _targetDna = _targetDna % dnaModulus;
        uint newDna = (myZombie.dna + _targetDna) / 2;
        if (keccak256(_species) == keccak256("kitty")) {
            newDna = newDna - newDna % 100 + 99;
        }        
        _createZombie("NoName", newDna);      
    }
    
    function feedOnKitty(uint _zombieId, uint _kittyId) public {
        uint kiityDna;
        (,,,,,,,,,kittyDna) = kittyContract.getKitty(_kittyId);
        feedAndMultiply(_zombieId, kiityDna, "kitty");
    }

}
