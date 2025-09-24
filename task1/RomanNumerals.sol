// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title RomanNumerals
/// @notice Converts a valid Roman numeral string to its integer value (1..3999)
contract RomanNumerals {
    /// @notice Convert a Roman numeral string to an unsigned integer
    /// @dev Assumes input is a valid Roman numeral per standard rules (subtractive pairs)
    /// @param s Roman numeral string comprised of characters: I,V,X,L,C,D,M
    /// @return value Integer value represented by the Roman numeral
    function romanToUint(string memory s) external pure returns (uint256 value) {
        bytes memory data = bytes(s);
        uint256 i = 0;
        while (i < data.length) {
            uint256 current = _charToValue(data[i]);
            if (i + 1 < data.length) {
                uint256 next = _charToValue(data[i + 1]);
                if (current < next) {
                    value += (next - current);
                    i += 2;
                    continue;
                }
            }
            value += current;
            i += 1;
        }
        return value;
    }

    function _charToValue(bytes1 c) private pure returns (uint256 v) {
        if (c == 0x49) return 1; // 'I'
        if (c == 0x56) return 5; // 'V'
        if (c == 0x58) return 10; // 'X'
        if (c == 0x4C) return 50; // 'L'
        if (c == 0x43) return 100; // 'C'
        if (c == 0x44) return 500; // 'D'
        if (c == 0x4D) return 1000; // 'M'
        revert("Invalid character");
    }
}


