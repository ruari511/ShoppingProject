package net.buycard.db;

public class CardDTO {
	private String cardNum;
	private String cardDate;
	private String cardCvc;
	private String cardPass;
	private String bank;
	private int installment;
	
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public int getInstallment() {
		return installment;
	}
	public void setInstallment(int installment) {
		this.installment = installment;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getCardDate() {
		return cardDate;
	}
	public void setCardDate(String cardDate) {
		this.cardDate = cardDate;
	}
	public String getCardCvc() {
		return cardCvc;
	}
	public void setCardCvc(String cardCvc) {
		this.cardCvc = cardCvc;
	}
	public String getCardPass() {
		return cardPass;
	}
	public void setCardPass(String cardPass) {
		this.cardPass = cardPass;
	}
	
	
}
