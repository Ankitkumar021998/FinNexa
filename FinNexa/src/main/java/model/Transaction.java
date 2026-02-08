package model;

import java.util.Date;

public class Transaction {
// TRANSACTION HISTORY MODULE

//	All transactions of logged-in user
//	Type (DEPOSIT / WITHDRAW / TRANSFER)
//	Amount
//	Date & Time
//	Sorted by latest first

	private String type;
	private double amount;
	private Date txnDate;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getTxnDate() {
		return txnDate;
	}

	public void setTxnDate(Date txnDate) {
		this.txnDate = txnDate;
	}

}
