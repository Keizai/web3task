// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title BinarySearch
/// @notice Performs binary search over an ascending-sorted uint256 array
contract BinarySearch {
    /// @notice Search for target in an ascending-sorted array
    /// @param arr Ascending-sorted array
    /// @param target Value to search for
    /// @return found True if target exists in arr
    /// @return index Index of target if found; undefined when not found (0 returned)
    function binarySearch(uint256[] memory arr, uint256 target) external pure returns (bool found, uint256 index) {
        uint256 n = arr.length;
        uint256 left = 0;
        uint256 right = n;
        while (left < right) {
            uint256 mid = left + (right - left) / 2;
            uint256 value = arr[mid];
            if (value < target) {
                unchecked { left = mid + 1; }
            } else {
                right = mid;
            }
        }
        if (left < n && arr[left] == target) {
            return (true, left);
        }
        return (false, 0);
    }
}


