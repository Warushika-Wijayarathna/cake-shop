package com.primeplus.cakeshop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private int id;
    private String username;
    private String productList;
    private BigDecimal total;
    private Timestamp orderDate;
}
