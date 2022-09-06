//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*contract MagicNumberAttack {
    function whatIsTheMeaningOfLife() public pure returns (uint8){
        return 1;
    }
}
*/
//gerar a função que retorna 42 diretamente com OP Code
//gerar os opcodes para registrar o contrato
//registrar o contrato e pegar o endereço
contract MagicNumberAttack {
    address public checkAddress;

    function attack() public returns (address) {
        address deployedContractAddress;
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, shl(0x68, 0x69602A60005260206000F3600052600A6016F3))
            deployedContractAddress := create(0, ptr, 0x13)
        }
        checkAddress=deployedContractAddress;
        return deployedContractAddress;
    }
}
