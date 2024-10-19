package bookstorePTIT.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Order_Items")
public class Order_Items {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "orderID", nullable = false)
    private int orderID;

    @Column(name = "bookID", nullable = false)
    private int bookID;

    @Column(name = "quantity", nullable = false)
    private int quantity;

    @Column(name = "price", nullable = false)
    private int price;

    public Order_Items(int id, int orderID, int bookID, int quantity, int price) {
        this.id = id;
        this.orderID = orderID;
        this.bookID = bookID;
        this.quantity = quantity;
        this.price = price;
    }

    public Order_Items() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderItems{id=" + id + ", orderID=" + orderID + ", bookID=" + bookID + ", quantity=" + quantity + ", price=" + price + "}";
    }

}
