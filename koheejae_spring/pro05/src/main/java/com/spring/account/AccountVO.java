package com.spring.account;

public class AccountVO {
	private String accountNO;
	private String custName;
	private int balance;
	
	public AccountVO() {}
	
	public AccountVO(String accountNO, String custName, int balance) {
		this.accountNO = accountNO;
		this.custName = custName;
		this.balance = balance;
	}

	public String getAccountNO() {
		return accountNO;
	}

	public void setAccountNO(String accountNO) {
		this.accountNO = accountNO;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	
	
}
