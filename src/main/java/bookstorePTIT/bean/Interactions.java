package bookstorePTIT.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "User_Book_Interactions")
public class Interactions {
	@Id
    @Column(name = "interactionID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int interactionID;
	
	@Column(name = "accountID", nullable = false)
    private int accountID;
	
	@Column(name = "bookID", nullable = false)
    private int bookID;
	
	@Column(name = "interactionType", nullable = false)
    private int interactionType; //1 là view

	public Interactions() {
		super();
	}

	public Interactions(int interactionID, int accountID, int bookID, int interactionType) {
		super();
		this.interactionID = interactionID;
		this.accountID = accountID;
		this.bookID = bookID;
		this.interactionType = interactionType;
	}

	public int getInteractionID() {
		return interactionID;
	}

	public void setInteractionID(int interactionID) {
		this.interactionID = interactionID;
	}

	public int getAccountID() {
		return accountID;
	}

	public void setUserID(int accountID) {
		this.accountID = accountID;
	}

	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public int getInteractionType() {
		return interactionType;
	}

	public void setInteractionType(int interactionType) {
		this.interactionType = interactionType;
	}

	@Override
	public String toString() {
		return "Interactions [interactionID=" + interactionID + ", accountID=" + accountID + ", bookID=" + bookID
				+ ", interactionType=" + interactionType + "]";
	}
}