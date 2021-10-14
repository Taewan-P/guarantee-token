pragma solidity ^0.8.0;

import "openzeppelin-standard/ERC721.sol";

contract GuaranteeToken is ERC721 {
    constructor() ERC721("GuaranteeToken", "GTK") {}
}
