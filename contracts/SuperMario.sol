//SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import {ERC721} from "./ERC721.sol";


contract SuperMario is ERC721{
    string public name;
    string public symbol;    
    uint256 public tokenId=1;
    

    mapping(uint256 => string) private _tokenURIs;

    constructor(string memory _name, string memory _symbol) {
        name=_name;
        symbol=_symbol;
    }

    function tokenURI(uint256 _tokenId) public view returns(string memory) {
        require(_owners[_tokenId] != address(0), "ERC721Metadata: URI query for nonexistent token");
        return _tokenURIs[_tokenId];
    }

    function mint(string memory _tokenURI) public {    
        require(msg.sender != address(0), "Zero address minting not allowed");
        _balances[msg.sender] += 1;
        _owners[tokenId] = msg.sender;
        _tokenURIs[tokenId] = _tokenURI;
        
        emit Transfer(address(0), msg.sender, tokenId);
        tokenId++;
    }

    function supportsInterface(bytes4 interfaceId) public pure override returns(bool) {
        return (interfaceId == 0x80ac58cd || interfaceId == 0x5b5e139f);
    }

}