// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/forge-std/src/Test.sol";
import {Voting} from "task1/Voting.sol";

contract VotingTest is Test {
    Voting private voting;
    address private owner;
    address private user1;
    address private user2;

    function setUp() public {
        owner = address(0xA11CE);
        user1 = address(0xB0B);
        user2 = address(0xCAFE);
        vm.prank(owner);
        voting = new Voting();
    }

    function test_VoteOncePerAddress() public {
        bytes32 alice = keccak256("ALICE");
        vm.prank(user1);
        voting.vote(alice);
        assertEq(voting.getVotes(alice), 1);

        vm.prank(user1);
        vm.expectRevert(bytes("Already voted"));
        voting.vote(alice);
        assertEq(voting.getVotes(alice), 1);
    }

    function test_VoteMultipleAddresses() public {
        bytes32 alice = keccak256("ALICE");
        vm.prank(user1);
        voting.vote(alice);
        vm.prank(user2);
        voting.vote(alice);
        assertEq(voting.getVotes(alice), 2);
    }

    function test_ResetVotesOnlyOwner() public {
        bytes32 alice = keccak256("ALICE");
        vm.prank(user1);
        voting.vote(alice);
        assertEq(voting.getVotes(alice), 1);

        vm.prank(user1);
        vm.expectRevert(bytes("Not owner"));
        voting.resetVotes();

        vm.prank(owner);
        voting.resetVotes();
        assertEq(voting.getVotes(alice), 0);

        // After reset, user1 can vote again in new round
        vm.prank(user1);
        voting.vote(alice);
        assertEq(voting.getVotes(alice), 1);
    }
}


