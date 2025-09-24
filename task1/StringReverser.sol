// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title StringReverser
/// @notice Provides a function to reverse a string (byte-wise)
contract StringReverser {
    /// @notice Reverse a string by bytes (ASCII-safe)
    /// @dev Multi-byte UTF-8 characters will be reversed by byte, not codepoint
    /// @param input The input string
    /// @return reversed The reversed string
    function reverse(string memory input) external pure returns (string memory reversed) {
        bytes memory data = bytes(input);
        uint256 length = data.length;
        for (uint256 i = 0; i < length / 2; i++) {
            bytes1 tmp = data[i];
            data[i] = data[length - 1 - i];
            data[length - 1 - i] = tmp;
        }
        return string(data);
    }
}


