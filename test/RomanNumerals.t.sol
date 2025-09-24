// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/forge-std/src/Test.sol";
import {RomanNumerals} from "task1/RomanNumerals.sol";

contract RomanNumeralsTest is Test {
    RomanNumerals private rn;

    function setUp() public {
        rn = new RomanNumerals();
    }

    function test_BasicExamples() public {
        assertEq(rn.romanToUint("III"), 3);
        assertEq(rn.romanToUint("IV"), 4);
        assertEq(rn.romanToUint("IX"), 9);
        assertEq(rn.romanToUint("LVIII"), 58);
        assertEq(rn.romanToUint("MCMXCIV"), 1994);
    }
}


