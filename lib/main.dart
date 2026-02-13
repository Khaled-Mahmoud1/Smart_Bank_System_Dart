import 'dart:io';

import 'models/account.dart';
import 'models/savings_account.dart';
import 'models/current_account.dart';

void main() {
  List<Account> accounts = [];

  bool isRunning = true;

  while (isRunning) {
    print("\n====== SMART BANK SYSTEM ======");
    print("1. Create Savings Account");
    print("2. Create Current Account");
    print("3. Deposit");
    print("4. Withdraw");
    print("5. Transfer");
    print("6. Show Account Details");
    print("7. Show Transactions");
    print("8. Exit");
    print("================================");

    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        createSavingsAccount(accounts);
        break;

      case "2":
        createCurrentAccount(accounts);
        break;

      case "3":
        depositToAccount(accounts);
        break;

      case "4":
        withdrawFromAccount(accounts);
        break;

      case "5":
        transferBetweenAccounts(accounts);
        break;

      case "6":
        showAccountDetails(accounts);
        break;

      case "7":
        showAccountTransactions(accounts);
        break;

      case "8":
        isRunning = false;
        print("Exiting system...");
        break;

      default:
        print("Invalid choice.");
    }
  }
}

// Function to create a savings account
void createSavingsAccount(List<Account> accounts) {
  stdout.write("Account Number: ");
  String accNum = stdin.readLineSync()!;

  stdout.write("Holder Name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Initial Balance: ");
  double balance = double.parse(stdin.readLineSync()!);

  stdout.write("Interest Rate (e.g. 0.05): ");
  double rate = double.parse(stdin.readLineSync()!);

  accounts.add(SavingsAccount(accNum, name, balance, rate));

  print("Savings Account created successfully.");
}

// Function to create a current account
void createCurrentAccount(List<Account> accounts) {
  stdout.write("Account Number: ");
  String accNum = stdin.readLineSync()!;

  stdout.write("Holder Name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Initial Balance: ");
  double balance = double.parse(stdin.readLineSync()!);

  stdout.write("Overdraft Limit: ");
  double limit = double.parse(stdin.readLineSync()!);

  accounts.add(CurrentAccount(accNum, name, balance, limit));

  print("Current Account created successfully.");
}

// Function to find an account by account number
Account? findAccount(List<Account> accounts, String accNum) {
  for (var acc in accounts) {
    if (acc.accountNumber == accNum) {
      return acc;
    }
  }
  return null;
}

// deposit function
void depositToAccount(List<Account> accounts) {
  stdout.write("Enter Account Number: ");
  String accNum = stdin.readLineSync()!;

  Account? acc = findAccount(accounts, accNum);

  if (acc == null) {
    print("Account not found.");
    return;
  }

  stdout.write("Enter Amount: ");
  double amount = double.parse(stdin.readLineSync()!);

  acc.deposit(amount);
}

// withdraw money from an account
void withdrawFromAccount(List<Account> accounts) {
  stdout.write("Enter Account Number: ");
  String accNum = stdin.readLineSync()!;

  Account? acc = findAccount(accounts, accNum);

  if (acc == null) {
    print("Account not found.");
    return;
  }

  stdout.write("Enter Amount: ");
  double amount = double.parse(stdin.readLineSync()!);

  acc.withdraw(amount);
}

// transfer money between accounts
void transferBetweenAccounts(List<Account> accounts) {
  stdout.write("From Account: ");
  String fromAcc = stdin.readLineSync()!;

  stdout.write("To Account: ");
  String toAcc = stdin.readLineSync()!;

  Account? sender = findAccount(accounts, fromAcc);
  Account? receiver = findAccount(accounts, toAcc);

  if (sender == null || receiver == null) {
    print("One or both accounts not found.");
    return;
  }

  stdout.write("Enter Amount: ");
  double amount = double.parse(stdin.readLineSync()!);

  sender.transfer(receiver, amount);
}

// show account details
void showAccountDetails(List<Account> accounts) {
  stdout.write("Enter Account Number: ");
  String accNum = stdin.readLineSync()!;

  Account? acc = findAccount(accounts, accNum);

  if (acc == null) {
    print("Account not found.");
    return;
  }

  acc.printDetails();
}

// show account transactions
void showAccountTransactions(List<Account> accounts) {
  stdout.write("Enter Account Number: ");
  String accNum = stdin.readLineSync()!;

  Account? acc = findAccount(accounts, accNum);

  if (acc == null) {
    print("Account not found.");
    return;
  }

  acc.showTransactions();
}
