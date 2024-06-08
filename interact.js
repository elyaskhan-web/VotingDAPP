const Voting = artifacts.require("Voting");

module.exports = async function(callback) {
  try {
    // Get accounts
    const accounts = await web3.eth.getAccounts();
    
    // Get deployed contract instance
    const votingInstance = await Voting.deployed();
    
    // Add candidates
    await votingInstance.addCandidate("Alice", { from: accounts[0] });
    await votingInstance.addCandidate("Bob", { from: accounts[0] });
    console.log("Candidates added");

    // Check and log candidate details
    const candidateCount = await votingInstance.getCandidateCount();
    for (let i = 0; i < candidateCount; i++) {
      const candidate = await votingInstance.getCandidate(i);
      console.log(`Candidate ${i}: ${candidate[1]} has ${candidate[2]} votes`);
    }

    // Vote for candidates
    await votingInstance.vote(0, { from: accounts[1] });
    console.log("Account 1 voted for candidate 0");

    try {
      // Try voting again with the same account (should fail)
      await votingInstance.vote(0, { from: accounts[1] });
    } catch (error) {
      console.log("Account 1 tried to vote again and failed, as expected");
    }

    // Vote from another account
    await votingInstance.vote(1, { from: accounts[2] });
    console.log("Account 2 voted for candidate 1");

    // Get and print all candidates and their vote counts again
    for (let i = 0; i < candidateCount; i++) {
      const candidate = await votingInstance.getCandidate(i);
      console.log(`Candidate ${i}: ${candidate[1]} has ${candidate[2]} votes`);
    }

    callback();
  } catch (error) {
    console.error(error);
    callback(error);
  }
};
