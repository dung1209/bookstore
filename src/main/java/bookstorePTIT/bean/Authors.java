package bookstorePTIT.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="Authors")
public class Authors {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int authorID;

    @Column(name="name", nullable=false, length=255)
    private String name;

    @Column(name="bio", length=1000)
    private String bio;

    @Column(name="birthdate", nullable=true)
    private Date birthdate;
    
    @OneToMany(mappedBy = "author")
    private Set<Books> books = new HashSet<>();
    

    public Authors(int id, String name, String bio, Date birthdate) {
        this.authorID = id;
        this.name = name;
        this.bio = bio;
        this.birthdate = birthdate;
    }

    public Authors() {
    }

    public int getId() {
        return authorID;
    }

    public void setId(int id) {
        this.authorID = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    @Override
    public String toString() {
        return "Authors{id=" + authorID + ", name='" + name + "', bio='" + bio + "', birthdate=" + birthdate + "}";
    }
}
