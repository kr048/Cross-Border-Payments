// SPDX-License-Identifier: MIT
pragma solidity >=0.5.16 <0.8.2;

contract CrossBorderPayment {
    address public owner;

    // Event declaration for transaction completion
    event PaymentProcessed(address indexed sender, address indexed receiver, uint amount, string currency);
    event Deposit(address indexed depositor, uint256 amount);

    constructor() public {
        owner = msg.sender;
    }

    // Function to handle cross-border payments
    function ProcessPayment(address payable receiver, uint amount, string memory currency) public payable {
        require(msg.sender == owner, "Only the owner can initiate payments.");
        require(address(this).balance >= amount, "Insufficient funds in contract.");

        emit PaymentProcessed(msg.sender, receiver, amount, currency);
        receiver.transfer(amount);
    }

    // Function to get the balance of the contract
    function GetBalance() public view returns (uint256) {
        return address(this).balance;
    }

   
    // Function to deposit money into the contract
       function DepositMoney() public payable {
        require(msg.value >= 50, "Amount must be greater than or equal to fifty dollars.");
        emit Deposit(msg.sender, msg.value);
    }

    // Function to send specified amount to recipient
    function SendPayment(address payable recipient, string memory currency) public payable {
        require(msg.value > 0, "Amount sent must be greater than zero.");
        recipient.transfer(msg.value);
        emit PaymentProcessed(msg.sender, recipient, msg.value, currency);
    }

    // Function to calculate tax amount based on amount and tax rate
    function calculateTax(uint amount, uint taxRate) public pure returns (uint) {
        uint taxAmount = (amount * taxRate) / 100;
        return taxAmount;
    }

    // Removed the RefundMoney function as it had logical issues with its implementation.
    // Refunds should be handled with careful consideration of the contract's logic and security.
}
