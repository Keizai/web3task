// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/forge-std/src/Test.sol";
import {IntegerToRoman} from "task1/IntegerToRoman.sol";

contract IntegerToRomanTest is Test {
    IntegerToRoman private conv;

    function setUp() public {
        conv = new IntegerToRoman();
    }

    function test_Examples() public {
        assertEq(conv.uintToRoman(3749), "MMMDCCXLIX");
        assertEq(conv.uintToRoman(58), "LVIII");
        assertEq(conv.uintToRoman(1994), "MCMXCIV");
    }

    function test_RangeEdges() public {
        assertEq(conv.uintToRoman(1), "I");
        assertEq(conv.uintToRoman(3999), "MMMCMXCIX");
    }
}


