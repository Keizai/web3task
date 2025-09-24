// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Vm {
    function prank(address sender) external;
    function expectRevert(bytes calldata revertData) external;
}

address constant HEVM_ADDRESS = address(uint160(uint256(keccak256("hevm cheat code"))));

contract Test {
    Vm public constant vm = Vm(HEVM_ADDRESS);

    function assertTrue(bool condition) internal pure {
        require(condition, "assertTrue failed");
    }

    function assertFalse(bool condition) internal pure {
        require(!condition, "assertFalse failed");
    }

    function assertEq(uint256 a, uint256 b) internal pure {
        require(a == b, "assertEq(uint256) failed");
    }

    function assertEq(bool a, bool b) internal pure {
        require(a == b, "assertEq(bool) failed");
    }

    function assertEq(string memory a, string memory b) internal pure {
        require(keccak256(bytes(a)) == keccak256(bytes(b)), "assertEq(string) failed");
    }

    function assertEq(bytes memory a, bytes memory b) internal pure {
        require(keccak256(a) == keccak256(b), "assertEq(bytes) failed");
    }

    function assertEq(uint256[] memory a, uint256[] memory b) internal pure {
        require(a.length == b.length, "assertEq(uint256[]) length mismatch");
        for (uint256 i = 0; i < a.length; i++) {
            require(a[i] == b[i], "assertEq(uint256[]) value mismatch");
        }
    }
}


