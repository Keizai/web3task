// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/forge-std/src/Test.sol";
import {BinarySearch} from "task1/BinarySearch.sol";

contract BinarySearchTest is Test {
    BinarySearch private bs;

    function setUp() public {
        bs = new BinarySearch();
    }

    function test_FoundAndNotFound() public {
        uint256[] memory arr = new uint256[](6);
        arr[0]=1; arr[1]=3; arr[2]=5; arr[3]=7; arr[4]=9; arr[5]=11;
        (bool found, uint256 idx) = bs.binarySearch(arr, 7);
        assertTrue(found);
        assertEq(idx, 3);

        (found, idx) = bs.binarySearch(arr, 6);
        assertFalse(found);
        assertEq(idx, 0);
    }
}


