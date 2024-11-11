package bookstorePTIT.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Carts")
public class Carts {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "accountID", nullable = false)
    private int accountID;

    @Column(name = "bookID", nullable = false)
    private int bookID;

    @Column(name = "quantity", nullable = false)
    private int quantity;

    public Carts(int id, int accountID, int bookID, int quantity) {
        this.id = id;
        this.accountID = accountID;
        this.bookID = bookID;
        this.quantity = quantity;
    }

    public Carts() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Carts{id=" + id + ", accountID=" + accountID + ", bookID=" + bookID + ", quantity=" + quantity + "}";
    }
}
