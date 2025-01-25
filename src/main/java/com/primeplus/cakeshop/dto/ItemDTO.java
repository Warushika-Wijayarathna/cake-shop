package com.primeplus.cakeshop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemDTO {
    private String name;
    private String description;
    private String image;
    private BigDecimal price;
    private BigDecimal discount;
    private int quantity;
    private int categoryId;
}
