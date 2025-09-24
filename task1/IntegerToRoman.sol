// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IntegerToRoman
/// @notice Converts integers in range [1, 3999] to Roman numerals
contract IntegerToRoman {
    /// @notice Convert an integer to a Roman numeral string
    /// @param num Integer in the range [1, 3999]
    /// @return roman The Roman numeral representation
    function uintToRoman(uint256 num) external pure returns (string memory roman) {
        require(num >= 1 && num <= 3999, "Out of range");

        uint16[13] memory values = [
            uint16(1000), 900, 500, 400,
            100, 90, 50, 40,
            10, 9, 5, 4,
            1
        ];

        string[13] memory symbols = [
            string("M"), string("CM"), string("D"), string("CD"),
            string("C"), string("XC"), string("L"), string("XL"),
            string("X"), string("IX"), string("V"), string("IV"),
            string("I")
        ];

        string memory result = "";
        for (uint256 i = 0; i < values.length; i++) {
            while (num >= values[i]) {
                result = string(abi.encodePacked(result, symbols[i]));
                num -= values[i];
            }
            if (num == 0) break;
        }
        return result;
    }
}


