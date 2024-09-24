package bookstorePTIT.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "Books")
public class Books {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Column(name = "authorID", nullable = false)
    private int authorID;

    @Column(name = "categoryID", nullable = false)
    private int categoryID;

    @Column(name = "title", nullable = false, length = 255)
    private String title;

    @Column(name = "price", nullable = false)
    private double price;

    @Column(name = "image", nullable = true, length = 255)
    private String image;

    @Column(name = "stock", nullable = false)
    private int stock;

    @Column(name = "sold", nullable = false)
    private int sold;

    @Column(name = "created_at", nullable = false)
    private Date createdAt;

    public Books(int id, String name, int authorID, int categoryID, String title, double price, String image, int stock, int sold, Date createdAt) {
        this.id = id;
        this.name = name;
        this.authorID = authorID;
        this.categoryID = categoryID;
        this.title = title;
        this.price = price;
        this.image = image;
        this.stock = stock;
        this.sold = sold;
        this.createdAt = createdAt;
    }

    public Books() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAuthorID() {
        return authorID;
    }

    public void setAuthorID(int authorID) {
        this.authorID = authorID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Books{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", authorID=" + authorID +
                ", categoryID=" + categoryID +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", stock=" + stock +
                ", sold=" + sold +
                ", createdAt=" + createdAt +
                '}';
    }
}
