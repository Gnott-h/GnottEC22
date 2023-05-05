/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author phu
 */
public class Accounts {
   private String gmail;
   private String accName;
   private String passWord;

    public Accounts() {
    }

    public Accounts(String accName, String passWord, String gmail) {
        this.accName = accName;
        this.passWord = passWord;
        this.gmail = gmail;
    }

    public String getAccName() {
        return accName;
    }

    public void setAccName(String accName) {
        this.accName = accName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    
   
   
    
}