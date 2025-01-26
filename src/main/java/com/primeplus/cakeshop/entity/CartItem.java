package com.primeplus.cakeshop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
    private String id;
    private String name;
    private double price;
    private int quantity;
    private String description;
    private String image;
    private double discount;

}
