package bookstorePTIT.bean;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Imports")
public class Imports {
	@Id
	@Column(name = "importID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int importID;
	
	@ManyToOne
	@JoinColumn(name = "bookID")
	private Books book;
	
	@Column(name = "quantity")
	private int quantity;
	
	@Column(name = "received_at")
	private Date received_at;
	
	@Column(name = "price_import")
	private int price_import;

	public Imports() {
		
	}

	public Imports(int importID, Books book, int quantity, Date received_at, int price_import) {
		this.importID = importID;
		this.book = book;
		this.quantity = quantity;
		this.received_at = received_at;
		this.price_import = price_import;
	}

	public int getImportID() {
		return importID;
	}

	public void setImportID(int importID) {
		this.importID = importID;
	}

	public Books getBook() {
		return book;
	}

	public void setBook(Books book) {
		this.book = book;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getReceived_at() {
		return received_at;
	}

	public void setReceived_at(Date received_at) {
		this.received_at = received_at;
	}

	public int getPrice_import() {
		return price_import;
	}

	public void setPrice_import(int price_import) {
		this.price_import = price_import;
	}

	@Override
	public String toString() {
		return "Imports{importID=" + importID + ", book=" + book + ", quantity=" + quantity + ", received_at="
				+ received_at + ", price_import=" + price_import + "}";
	}
	
	
}
