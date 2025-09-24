// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title MergeSortedArray
/// @notice Merges two ascending-sorted arrays into one ascending-sorted array
contract MergeSortedArray {
    /// @notice Merge two ascending-sorted arrays
    /// @param a First ascending-sorted array
    /// @param b Second ascending-sorted array
    /// @return result Merged ascending-sorted array containing all elements from a and b
    function mergeSorted(uint256[] memory a, uint256[] memory b) external pure returns (uint256[] memory result) {
        uint256 lengthA = a.length;
        uint256 lengthB = b.length;
        result = new uint256[](lengthA + lengthB);

        uint256 i = 0;
        uint256 j = 0;
        uint256 k = 0;

        while (i < lengthA && j < lengthB) {
            if (a[i] <= b[j]) {
                result[k] = a[i];
                unchecked { i++; }
            } else {
                result[k] = b[j];
                unchecked { j++; }
            }
            unchecked { k++; }
        }

        while (i < lengthA) {
            result[k] = a[i];
            unchecked { i++; k++; }
        }

        while (j < lengthB) {
            result[k] = b[j];
            unchecked { j++; k++; }
        }

        return result;
    }
}


