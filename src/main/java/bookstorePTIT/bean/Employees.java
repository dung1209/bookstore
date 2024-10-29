package bookstorePTIT.bean;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Employees")
public class Employees {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int employeeID;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "accountID", unique = true)
    private Accounts account;

	@Column(name = "name")
	private String name;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "CCCD")
	private String CCCD;
	
	@Column(name = "address")
	private String address;

	public Employees() {
	}

	public Employees(int employeeID, Accounts account, String name, String phone, String cCCD, String address) {
		super();
		this.employeeID = employeeID;
		this.account = account;
		this.name = name;
		this.phone = phone;
		CCCD = cCCD;
		this.address = address;
	}

	public int getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}

	public Accounts getAccount() {
		return account;
	}

	public void setAccount(Accounts account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCCCD() {
		return CCCD;
	}

	public void setCCCD(String cCCD) {
		CCCD = cCCD;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Employees{employeeID=" + employeeID + ", account=" + account + ", name=" + name + ", phone=" + phone
				+ ", CCCD=" + CCCD + ", address=" + address + "}";
	}
	
	
}
