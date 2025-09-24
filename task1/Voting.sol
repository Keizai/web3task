// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Voting
/// @notice Simple voting contract with ability to reset all vote counts
/// @dev Candidates are identified by bytes32 identifiers (e.g., keccak256 of a name)
contract Voting {
    // Owner of the contract
    address private owner;

    // Mapping to store the number of votes for each candidate
    mapping(bytes32 => uint256) private candidateIdToVotes;

    // Tracks known candidate identifiers to enable resetting all counts
    bytes32[] private candidateIds;
    mapping(bytes32 => bool) private candidateIdIsTracked;

    // Tracks voting eligibility per round to ensure one vote per address per round
    uint256 private currentRound = 1;
    mapping(address => uint256) private voterLastVotedRound;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    event Voted(bytes32 indexed candidateId, address indexed voter, uint256 newVotes);
    event VotesReset();

    constructor() {
        owner = msg.sender;
    }

    /// @notice Vote for a candidate
    /// @param candidateId The identifier of the candidate
    function vote(bytes32 candidateId) external {
        require(voterLastVotedRound[msg.sender] != currentRound, "Already voted");
        voterLastVotedRound[msg.sender] = currentRound;
        if (!candidateIdIsTracked[candidateId]) {
            candidateIdIsTracked[candidateId] = true;
            candidateIds.push(candidateId);
        }
        uint256 updatedVotes = candidateIdToVotes[candidateId] + 1;
        candidateIdToVotes[candidateId] = updatedVotes;
        emit Voted(candidateId, msg.sender, updatedVotes);
    }

    /// @notice Get the total number of votes for a candidate
    /// @param candidateId The identifier of the candidate
    /// @return votes The vote count
    function getVotes(bytes32 candidateId) external view returns (uint256 votes) {
        return candidateIdToVotes[candidateId];
    }

    /// @notice Reset the vote counts for all known candidates to zero
    function resetVotes() external onlyOwner {
        uint256 totalCandidates = candidateIds.length;
        for (uint256 i = 0; i < totalCandidates; i++) {
            bytes32 candidateId = candidateIds[i];
            candidateIdToVotes[candidateId] = 0;
        }
        currentRound += 1;
        emit VotesReset();
    }
}


