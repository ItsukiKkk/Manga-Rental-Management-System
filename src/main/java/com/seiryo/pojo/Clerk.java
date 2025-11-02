package com.seiryo.pojo;

/**
 * エンティティクラス：店員
 */
public class Clerk {
    private String clerkId;
    private String lastname;
    private String lastkana;
    private String firstname;
    private String firstkana;
    private String password;

    public String getClerkId() {
        return clerkId;
    }

    public void setClerkId(String clerkId) {
        this.clerkId = clerkId;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getLastkana() {
        return lastkana;
    }

    public void setLastkana(String lastkana) {
        this.lastkana = lastkana;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getFirstkana() {
        return firstkana;
    }

    public void setFirstkana(String firstkana) {
        this.firstkana = firstkana;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Clerk(String clerkId, String lastname, String lastkana, String firstname, String firstkana, String password) {
        super();
        this.clerkId = clerkId;
        this.lastname = lastname;
        this.lastkana = lastkana;
        this.firstname = firstname;
        this.firstkana = firstkana;
        this.password = password;
    }

    public Clerk() {
        super();
    }

    @Override
    public String toString() {
        return "Clerk [clerkId=" + clerkId + ", lastname=" + lastname + ", lastkana=" + lastkana + ", firstname="
                + firstname + ", firstkana=" + firstkana + ", password=" + password + "]";
    }
}
