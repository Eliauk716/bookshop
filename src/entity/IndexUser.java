package entity;
//实体类
public class IndexUser {
	private int id;
	private String name;
	private String pwd;
	private String email;
	private String type;
	private int sex;

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getType() {
		return type;
	}

	public IndexUser(String name, String email, int sex) {
		super();
		this.name = name;
		this.email = email;
		this.sex = sex;
	}

	public void setType(String type) {
		this.type = type;
	}

	public IndexUser(String name, String pwd, String email, String type) {
		super();
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.type = type;
	}

	public IndexUser(String name, String pwd, String email, String type, int sex) {
		super();
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.type = type;
		this.sex = sex;
	}

	public IndexUser(String name, String pwd, String email) {
		this.name = name;
		this.pwd = pwd;
		this.email = email;
	}

	public IndexUser(String name, String pwd) {
		this.name = name;
		this.pwd = pwd;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
