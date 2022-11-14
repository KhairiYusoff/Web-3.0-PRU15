// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.0 <0.9.0;

contract Election {
    //Model a candidate
    struct Party {
        uint id;
        string partyName;
        uint voteCount;
    }

    // Store accounts which have voted
    mapping(address => bool) public voters;
    // Store Candidates
    // Fetch Candidate
    mapping(uint => Party) public parties; //uint represents candidateId
    // Store Candidate Count
    uint public partiesCount;

    // Constructor
    constructor() public {
        addParty("Parti Bulan");
        addParty("Parti Bintang");
        addParty("Parti Merdeka");
    }

    // Add party name
    function addParty(string memory _partyName) private {
        partiesCount++;
        parties[partiesCount] = Party(partiesCount, _partyName, 0); // Add with incremented partiesCount and number of vote
    }

    // Vote
    function vote(uint _partyId) public {
        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote count
        parties[_partyId].voteCount++;
    }

    // Return vote count
    function getVote(uint _partyId) public view returns (uint256) {
        return parties[_partyId].voteCount;
    }
}
