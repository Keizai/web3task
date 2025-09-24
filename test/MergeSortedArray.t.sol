// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/forge-std/src/Test.sol";
import {MergeSortedArray} from "task1/MergeSortedArray.sol";

contract MergeSortedArrayTest is Test {
    MergeSortedArray private merger;

    function setUp() public {
        merger = new MergeSortedArray();
    }

    function test_MergeBasics() public {
        uint256[] memory a = new uint256[](3);
        a[0] = 1; a[1] = 3; a[2] = 5;
        uint256[] memory b = new uint256[](3);
        b[0] = 2; b[1] = 4; b[2] = 6;
        uint256[] memory res = merger.mergeSorted(a, b);
        uint256[] memory expected = new uint256[](6);
        expected[0]=1; expected[1]=2; expected[2]=3; expected[3]=4; expected[4]=5; expected[5]=6;
        assertEq(res, expected);
    }

    function test_MergeWithEmpty() public {
        uint256[] memory a = new uint256[](0);
        uint256[] memory b = new uint256[](2);
        b[0]=1; b[1]=2;
        uint256[] memory res = merger.mergeSorted(a, b);
        assertEq(res.length, 2);
        assertEq(res[0], 1);
        assertEq(res[1], 2);
    }
}


