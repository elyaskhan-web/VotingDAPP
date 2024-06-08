// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // State variables
    address public owner; // Address of the contract owner
    
    // Struct to store candidate details
    struct Candidate {
        uint256 id; // Unique identifier for the candidate
        string name; // Name of the candidate
        uint256 voteCount; // Number of votes received by the candidate
    }
    
    // Array to store all candidates
    Candidate[] public candidates;
    
    // Mapping to track whether an address has voted
    mapping(address => bool) public voters;

    // Modifier to restrict certain functions to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Function to add a new candidate
    function addCandidate(string memory _name) public onlyOwner {
        // Push a new candidate with a unique ID to the candidates array
        candidates.push(Candidate(candidates.length, _name, 0));
    }

    // Function to allow a voter to cast a vote for a candidate
    function vote(uint256 _candidateId) public {
        // Check if the candidate ID is valid
        require(_candidateId < candidates.length, "Invalid candidate ID");
        // Check if the voter has not already voted
        require(!voters[msg.sender], "You have already voted");

        // Increment the vote count of the chosen candidate
        candidates[_candidateId].voteCount++;
        // Mark the voter as having voted
        voters[msg.sender] = true;
    }

    // Function to get the total number of candidates
    function getCandidateCount() public view returns (uint256) {
        return candidates.length;
    }

    // Function to get details of a specific candidate by ID
    function getCandidate(uint256 _id) public view returns (uint256, string memory, uint256) {
        // Check if the candidate ID is valid
        require(_id < candidates.length, "Invalid candidate ID");
        // Get the candidate details
        Candidate memory candidate = candidates[_id];
        // Return the candidate details
        return (candidate.id, candidate.name, candidate.voteCount);
    }
}
