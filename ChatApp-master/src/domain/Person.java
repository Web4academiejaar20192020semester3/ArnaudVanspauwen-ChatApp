package domain;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Person {

    private String userId;
    private String password;
    private String salt;
    private String firstName;
    private String lastName;
    private Role role;
    //Toevoegingen
    private FriendList friendList;
    private String geslacht;
    private int leeftijd;
    private String state = "OFFLINE";

    public Person(String userId, String password, String firstName,
                  String lastName, String geslacht, int leeftijd, Role role) {
        setUserId(userId);
        setHashedPassword(password);
        setFirstName(firstName);
        setLastName(lastName);
        setRole(role);
        setGeslacht(geslacht);
        setLeeftijd(leeftijd);
        friendList = new FriendList();
    }

    public Person(String userId, String password, String salt,
                  String firstName, String lastName, String geslacht, int leeftijd, Role role) {
        setUserId(userId);
        setPassword(password);
        setSalt(salt);
        setFirstName(firstName);
        setLastName(lastName);
        setRole(role);
        setGeslacht(geslacht);
        setLeeftijd(leeftijd);
        friendList = new FriendList();
    }

    public Person() {
    }

    public Role getRole() {
        return this.role;
    }

    public void setRole(Role role) {
        this.role = role;
    }


    public void setUserId(String userId) {
        if (userId.isEmpty()) {
            throw new IllegalArgumentException("Email niet correct (leeg)");
        }
        String USERID_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        Pattern p = Pattern.compile(USERID_PATTERN);
        Matcher m = p.matcher(userId);
        if (!m.matches()) {
            throw new IllegalArgumentException("Email niet correct (leeg)");
        }
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public String getPassword() {
        return password;
    }

    public boolean isCorrectPassword(String password) {
        if (password.isEmpty()) {
            throw new IllegalArgumentException("Geef paswoord");
        }
        return getPassword().equals(hashPassword(password, getSalt()));
    }

    public void setPassword(String password) {
        if (password.isEmpty()) {
            throw new IllegalArgumentException("Geef een paswoord in");
        }
        this.password = password;
    }

    public void setHashedPassword(String password) {
        if (password.isEmpty()) {
            throw new IllegalArgumentException("Geef een paswoord in");
        }
        this.password = hashPassword(password);
    }

    private String hashPassword(String password) {
        SecureRandom random = new SecureRandom();
        byte[] seed = random.generateSeed(20);

        String salt = new BigInteger(1, seed).toString(16);
        this.setSalt(salt);

        return hashPassword(password, salt);
    }

    private String hashPassword(String password, String seed) {
        String hashedPassword = null;
        try {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(salt.getBytes("UTF-8"));
            crypt.update(password.getBytes("UTF-8"));
            hashedPassword = new BigInteger(1, crypt.digest()).toString(16);
        } catch (NoSuchAlgorithmException e) {
            throw new DomainException(e.getMessage(), e);
        } catch (UnsupportedEncodingException e) {
            throw new DomainException(e.getMessage(), e);
        }
        return hashedPassword;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getSalt() {
        return salt;
    }

    public String getGeslacht() {
        return geslacht;
    }

    public void setGeslacht(String geslacht) {
        if (geslacht.isEmpty()) {
            throw new IllegalArgumentException("Geen geslacht gegeven");
        }
        this.geslacht = geslacht;
    }

    public int getLeeftijd() {
        return leeftijd;
    }

    public void setLeeftijd(int leeftijd) {
        this.leeftijd = leeftijd;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        if (firstName.isEmpty()) {
            throw new IllegalArgumentException("Geen voornaam gegeven");
        }
        this.firstName = firstName;// firstName;

    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        if (lastName.isEmpty()) {
            throw new IllegalArgumentException("Geen achternaam gegeven");
        }
        this.lastName = lastName;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void addFriend(Person friend) {
        friendList.addFriend(friend);
    }

    public ArrayList<Person> getFriends() {
        return friendList.getAll();
    }

}
