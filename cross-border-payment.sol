 //SPDX-License-Identifier: MIT
 pragma solidity ^0.8.0;


contract CrossBorderPayment {
    address public owner;

    // Event declaration for transaction completion
    event PaymentProcessed(address sender, address receiver, uint amount, string currency);

    constructor() {
        owner = msg.sender;
    }

    // Function to handle cross-border payments
    function processPayment(address payable receiver, uint amount, string memory currency) public {

        // Emitting an event after successful payment processing
        emit PaymentProcessed(msg.sender, receiver, amount, currency);

        // Transfer the specified amount to the receiver
        receiver.transfer(amount);
    }

    // Function to deposit funds into the contract
    receive() external payable {}

    // Ensure only the owner can withdraw funds (for simplicity)
    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only the owner can withdraw.");
        payable(owner).transfer(amount);
    }
}
