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

    @Column(name = "customerID", nullable = false)
    private int customerID;

    @Column(name = "bookID", nullable = false)
    private int bookID;

    @Column(name = "quantity", nullable = false)
    private int quantity;

    public Carts(int id, int customerID, int bookID, int quantity) {
        this.id = id;
        this.customerID = customerID;
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

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
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
        return "Carts{id=" + id + ", customerID=" + customerID + ", bookID=" + bookID + ", quantity=" + quantity + "}";
    }
}
