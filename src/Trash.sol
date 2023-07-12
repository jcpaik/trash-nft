// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.17;

import {ERC721} from "solmate/tokens/ERC721.sol";
import {Strings} from "openzeppelin/utils/Strings.sol";
import {Ownable} from "openzeppelin/access/Ownable.sol";
import {SafeTransferLib} from "solmate/utils/SafeTransferLib.sol";

error TokenDoesNotExist();
error TokenNotTransferrable();

contract Trash is ERC721, Ownable {
    using Strings for uint256;

    uint256 public totalSupply = 0;
    string public baseURI;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _baseURI
    ) ERC721(_name, _symbol) {
        baseURI = _baseURI;
    }

    function mint(address to, uint256 id) external onlyOwner {
        unchecked {
            _mint(to, id);
            totalSupply++;
        }
    }

    function transferFrom(
        address from,
        address to,
        uint256 id
    ) public override {
        revert TokenNotTransferrable();
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        if (_ownerOf[tokenId] == address(0)) {
            revert TokenDoesNotExist();
        }

        return baseURI;
    }
}