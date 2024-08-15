package pkg1;

import java.sql.Date;

public class BBook {
    private int borrowedBookID;
    private int book; 
    private int user; 
    private Date borrowedDate;
    private Date returnDate;
    private String status;
	public int getBorrowedBookID() {
		return borrowedBookID;
	}
	public void setBorrowedBookID(int borrowedBookID) {
		this.borrowedBookID = borrowedBookID;
	}
	public int getBook() {
		return book;
	}
	public void setBook(int book) {
		this.book = book;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	public Date getBorrowedDate() {
		return borrowedDate;
	}
	public void setBorrowedDate(Date borrowedDate) {
		this.borrowedDate = borrowedDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public BBook(int borrowedBookID, int book, int user, Date borrowedDate, Date returnDate, String status) {
		
		this.borrowedBookID = borrowedBookID;
		this.book = book;
		this.user = user;
		this.borrowedDate = borrowedDate;
		this.returnDate = returnDate;
		this.status = status;
	}
	public BBook() {
		this.borrowedBookID = 0;
		this.book = 0;
		this.user = 0;
		this.borrowedDate = null;
		this.returnDate = null;
		this.status = "";
	}

    
}
