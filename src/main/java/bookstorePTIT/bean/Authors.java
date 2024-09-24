package bookstorePTIT.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name="Authors")
public class Authors {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="name", nullable=false, length=255)
    private String name;

    @Column(name="bio", nullable=true, length=1000)
    private String bio;

    @Column(name="birthdate", nullable=true)
    private Date birthdate;

    public Authors(int id, String name, String bio, Date birthdate) {
        this.id = id;
        this.name = name;
        this.bio = bio;
        this.birthdate = birthdate;
    }

    public Authors() {
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
        return "Authors{id=" + id + ", name='" + name + "', bio='" + bio + "', birthdate=" + birthdate + "}";
    }
}
