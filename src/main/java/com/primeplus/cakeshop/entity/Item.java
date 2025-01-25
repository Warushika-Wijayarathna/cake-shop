package com.primeplus.cakeshop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Item {
    private int id;
    private String name;
    private String description;
    private byte[] image;
    private BigDecimal price;
    private BigDecimal discount;
    private int quantity;
    private int categoryId;
}
