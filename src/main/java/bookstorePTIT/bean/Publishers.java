package bookstorePTIT.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Publishers")
public class Publishers {
	@Id
	@Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int publisherID;
	
	@Column(name="name", nullable=false, length=255)
    private String name;
	
	@OneToMany(mappedBy = "publisher", fetch = FetchType.EAGER)
    private Set<Books> books = new HashSet<>();

	public Publishers(int publisherID, String name, Set<Books> books) {
		super();
		this.publisherID = publisherID;
		this.name = name;
		this.books = books;
	}

	public Publishers() {
		
	}

	public int getPublisherID() {
		return publisherID;
	}

	public void setPublisherID(int publisherID) {
		this.publisherID = publisherID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Books> getBooks() {
		return books;
	}

	public void setBooks(Set<Books> books) {
		this.books = books;
	}

	@Override
	public String toString() {
		return "Publishers {publisherID=" + publisherID + ", name=" + name + ", books=" + books + "}";
	}
	
	
}
