// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./standard/IERC165.sol";

contract ERC165Checker is IERC165 {
    mapping (bytes4 => bool) internal supportedInterfaces;
    
    constructor() {
        supportedInterfaces[this.supportsInterface.selector] = true;
    }
    function supportsInterface(bytes4 interfaceID) external view returns (bool) {
        return supportedInterfaces[interfaceID];
    }
}