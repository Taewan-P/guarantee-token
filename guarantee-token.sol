pragma solidity ^0.8.4;

// ERC721
interface ERC721 {

    // Token name
    string private _name;

    // Token symbol
    string private _symbol;


    // Required methods
    function balanceOf(address _owner) external view returns (uint256 balance);
    function ownerOf(uint256 _tokenId) external view returns (address owner);
    function approve(address _to, uint256 _tokenId) external;
    function transfer(address _to, uint256 _tokenId) external;
    function transferFrom(address _from, address _to, uint256 _tokenId) external;

    // Events
    event Transfer(address from, address to, uint256 tokenId);
    event Approval(address owner, address approved, uint256 tokenId);

    // Optional
    // function name() public view returns (string name);
    // function symbol() public view returns (string symbol);
    // function tokensOfOwner(address _owner) external view returns (uint256[] tokenIds);
    // function tokenMetadata(uint256 _tokenId, string _preferredTransport) public view returns (string infoUrl);

    // ERC-165 Compatibility (https://github.com/ethereum/EIPs/issues/165)
    function supportsInterface(bytes4 _interfaceID) external view returns (bool);
}

struct Guarantee {
    // One and only genetic information.
    uint256 genes;

    // Created timestamp.
    uint32 createdTime;

    // Information about what is guaranteed. This will include the serial number, warranty expiration date.
    bytes32 guaranteed;

     
}

contract GuaranteeToken is ERC721 {
    constructor() ERC721("GuaranteeToken", "GTK") { }
    
}