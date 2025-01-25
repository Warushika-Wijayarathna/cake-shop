package com.primeplus.cakeshop.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Follower {
    private int id;
    private String username;
    private String email;
    private String password;
}
