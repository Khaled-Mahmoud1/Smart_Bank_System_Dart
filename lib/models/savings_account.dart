import 'account.dart';

class SavingsAccount extends Account {
  final double interestRate;

  SavingsAccount(
    String accountNumber,
    String holderName,
    double initialBalance,
    this.interestRate,
  ) : super(accountNumber, holderName, initialBalance);

  @override
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Invalid withdraw amount.");
      return;
    }

    if (amount > balance) {
      print("Insufficient balance.");
    } else {
      updateBalance(balance - amount);
      recordWithdraw(amount);
      print("Withdrawn: $amount");
    }
  }

  void addInterest() {
    double interest = balance * interestRate;
    deposit(interest);
    print("Interest added: $interest");
  }
}
