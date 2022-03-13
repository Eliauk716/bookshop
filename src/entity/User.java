package entity;

public class User {
    private int s_id;
    private String username;
    private String password;
    private String s_type;
    private String email;

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String user) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getS_type() {
        return s_type;
    }

    public void setS_type(String s_type) {
        this.s_type = s_type;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public User(int s_id, String username, String password, String s_type, String email) {
        this.s_id = s_id;
        this.username = username;
        this.password = password;
        this.s_type = s_type;
        this.email = email;
    }
}
