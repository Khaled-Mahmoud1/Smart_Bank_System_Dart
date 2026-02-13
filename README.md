#  Smart Bank System (Dart OOP Project)

A console-based banking system built using **Dart** to demonstrate core Object-Oriented Programming (OOP) principles.

---

##  Overview

Smart Bank System is a CLI (Command Line Interface) application that simulates basic banking operations such as:

- Creating accounts
- Depositing money
- Withdrawing money
- Transferring funds
- Tracking transactions
- Viewing account details

This project focuses on applying OOP concepts in a clean and structured way.

---

##  OOP Concepts Applied

- ✅ Abstract Classes
- ✅ Inheritance
- ✅ Method Overriding
- ✅ Encapsulation
- ✅ Polymorphism
- ✅ Interface (Printable)
- ✅ Composition
- ✅ Enum
- ✅ Static Members

---

##  Project Structure

lib/
│
├── main.dart
│
├── models/
│ ├── account.dart
│ ├── savings_account.dart
│ ├── current_account.dart
│ └── transaction.dart
│
├── enums/
│ └── transaction_type.dart
│
└── interfaces/
└── printable.dart

---

## 🏦 Account Types

### 1- Savings Account
- Cannot withdraw more than balance
- Supports interest rate
- Includes `addInterest()` method

### 2- Current Account
- Supports overdraft limit
- Allows negative balance up to a defined limit

---

##  Core Features

### Deposit
Adds money to an account and records the transaction.

### Withdraw
Withdraws money based on account rules.

### Transfer
Transfers money between two accounts using polymorphism.

### Transactions
Each account stores its own transaction history.

---

## Printable Interface

The `Printable` interface ensures that any printable object implements:

```dart
void printDetails();

```
---

## Console Menu

1. Create Savings Account
2. Create Current Account
3. Deposit
4. Withdraw
5. Transfer
6. Show Account Details
7. Show Transactions
8. Exit

---

## Khaled Mahmoud