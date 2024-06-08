# Voting Application

## Introduction

This project is a decentralized Voting Application implemented using Solidity and deployed on the Ethereum blockchain. The application allows for a transparent, secure, and tamper-proof voting process. It includes functionalities for adding candidates, casting votes, and viewing election results.

## Features

- **Add Candidates**: Only the contract owner can add new candidates to the election.
- **Vote**: Registered voters can cast one vote for their preferred candidate.
- **View Results**: Anyone can view the current standings and vote counts for each candidate.
- **Ownership**: Ensures that only the contract owner can manage election operations like adding candidates.

## Prerequisites

To set up and run this project, you will need the following tools installed on your system:

- Node.js
- Truffle
- Ganache (for local development and testing)
- MetaMask (for interacting with the deployed contract)

## Project Structure

- `contracts/`: Contains the Solidity smart contract (`Voting.sol`).
- `migrations/`: Contains migration scripts for deploying the smart contract.
- `test/`: Contains test files for testing the smart contract.
- `scripts/`: Contains JavaScript files for interacting with the smart contract.
- `truffle-config.js`: Truffle configuration file.

## Getting Started

### 1. Install Dependencies

First, install the necessary dependencies:

```bash
npm install
