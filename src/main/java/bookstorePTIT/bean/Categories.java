package bookstorePTIT.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Categories") 
public class Categories {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryID;

    @Column(name="name", nullable=false, length=255)
    private String name;
    
    @OneToMany(mappedBy = "category")
    private Set<Books> books = new HashSet<>();
    
    public Categories(int id, String name) {
        this.categoryID = id;
        this.name = name;
    }
    
    public Categories() {
    }
    
    public int getId() {
        return categoryID;
    }

    public void setId(int id) {
        this.categoryID = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    @Override
    public String toString() {
        return "Categories{id=" + categoryID + ", name='" + name + "'}";
    }
    
}
