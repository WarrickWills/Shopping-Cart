/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Adam Frewen 0813664
 * @author Warrick Wills 13831575
 */
public class Cart implements Serializable {

    ArrayList<String> cart = new ArrayList<>();

    public ArrayList<String> getCart() {
        return cart;
    }

    public void setCart(ArrayList<String> cart) {
        this.cart = cart;
    }

}
