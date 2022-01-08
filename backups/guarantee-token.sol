pragma solidity ^0.8.4;

import "./ERC165Checker.sol";
import "./standard/IERC721.sol";

contract ERC721 is IERC721, ERC165Checker {
    // Variables
    address internal creator;
    uint256 internal maxId;
    mapping (uint256 => address) internal _owners;
    mapping (address => uint256) internal _balances;
    mapping (address => mapping (address => bool)) internal _operatorApprovals;

    constructor(uint _initialSupply) ERC165Checker() {
        creator = msg.sender;
        _balances[msg.sender] = _initialSupply;
        maxId = _initialSupply;

        //Add to ERC165 Interface Check
        supportedInterfaces[
            this.balanceOf.selector ^
            this.ownerOf.selector ^
            //this.safeTransferFrom.selector ^
            //Have to manually do the two transferFroms because overloading confuse selector
            bytes4(keccak256("safeTransferFrom(address,address,uint256)"))^
            bytes4(keccak256("safeTransferFrom(address,address,uint256,bytes)"))^
            this.transferFrom.selector ^
            this.approve.selector ^
            this.setApprovalForAll.selector ^
            this.getApproved.selector ^
            this.isApprovedForAll.selector
        ] = true;
    }

    // owner가 가지고 있는 NFT의 수를 반환
    function balanceOf(address _owner) external view returns (uint256) {
        require(_owner != address(0), "ERC721: balance query for the zero address");
        return _balances[_owner];
    }

    // NFT tokenID를 받으면 그 주인의 지갑 주소를 반환
    function ownerOf(uint256 tokenId) external view returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");
        return owner;
    }

    // from 에서 to 로 tokenID라는 NFT의 소유권을 옮김 
    function safeTransferFrom(address from, address to, uint256 tokenId) external {
        // safeTransferFrom(from, to, tokenId, "");
    }

    // 마찬가지로 NFT의 소유권을 옮기나, to 의 address가 유효하지 않으면 NFT가 사라짐
    function transferFrom(address from, address to, uint256 tokenId) external {

    }

    // NFT를 대신 승인할 수 있게끔 권한을 넘겨주는것. 여기서 승인이란 transaction을 말함
    function approve(address to, uint256 tokenId) external {

    }

    // NFT 대신 승인 가능한 권한을 가진 주소 반환
    function getApproved(uint256 tokenId) external view returns (address) {

    }

    // Operator가 owner에게 승인 가능한 권한을 받았는지 확인
    function isApprovedForAll(address owner, address operator) external view returns (bool) {

    }

    // from 에서 to 로 tokenID라는 NFT의 소유권을 옮김 
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata _data) external {
        // require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");
        // _safeTransfer(from, to, tokenId, _data);
    }

}


contract GuaranteeToken is ERC721 {

    struct Guarantee {
        // Created timestamp.
        uint32 createdTime;

        // Information about what is guaranteed. This will include the serial number, warranty expiration date.
        bytes32 guaranteed;
    }

    Guarantee[] public guarantees;
    address public owner;

    constructor () public {
        owner = msg.sender;
    }
}