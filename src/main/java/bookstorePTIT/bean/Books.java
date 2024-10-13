package bookstorePTIT.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Books")
public class Books {

    @Id
    @Column(name = "bookID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bookID;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @ManyToOne
    @JoinColumn(name = "authorID")
    private Authors author;

    @ManyToOne
    @JoinColumn(name = "categoryID")
    private Categories category;
    
    @ManyToOne
    @JoinColumn(name = "publisherID")
    private Publishers publisher;

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

    @Column(name = "publication_date", nullable = false)
    private int publicationDate;
    
    @Column(name = "created_at", nullable = false)
    private Date createdAt;
    
    @OneToMany(mappedBy = "book")
    private Set<Imports> books = new HashSet<>();

    public Books(int id, String name, Authors author, Categories category, Publishers publisher,String title, double price, String image, int stock, int sold,int publicationDate, Date createdAt) {
        this.bookID = id;
        this.name = name;
        this.author = author;
        this.category = category;
        this.publisher = publisher;
        this.title = title;
        this.price = price;
        this.image = image;
        this.stock = stock;
        this.sold = sold;
        this.publicationDate = publicationDate;
        this.createdAt = createdAt;
    }

    

	public Books() {
    }

    public int getbookID() {
        return bookID;
    }

    public void setId(int id) {
        this.bookID = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Authors getAuthor() {
        return author;
    }

    public void setAuthor(Authors author) {
        this.author = author;
    }

    public Categories getCategory() {
        return category;
    }

    public void setCategory(Categories category) {
    	this.category = category;
    }

    public Publishers getPublisher() {
		return publisher;
	}

	public void setPublisher(Publishers publisher) {
		this.publisher = publisher;
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
    
    public int getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(int publicationDate) {
		this.publicationDate = publicationDate;
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
                "id=" + bookID +
                ", name='" + name + '\'' +
                ", author=" + author +
                ", category=" + category +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", stock=" + stock +
                ", sold=" + sold +
                ", createdAt=" + createdAt +
                '}';
    }
}
