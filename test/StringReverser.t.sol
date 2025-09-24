// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/forge-std/src/Test.sol";
import {StringReverser} from "task1/StringReverser.sol";

contract StringReverserTest is Test {
    StringReverser private reverser;

    function setUp() public {
        reverser = new StringReverser();
    }

    function test_ReverseAscii() public {
        assertEq(reverser.reverse(""), "");
        assertEq(reverser.reverse("a"), "a");
        assertEq(reverser.reverse("ab"), "ba");
        assertEq(reverser.reverse("abcd"), "dcba");
        assertEq(reverser.reverse("racecar"), "racecar");
    }
}


