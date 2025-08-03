package com.model;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "bala_donations")
@Data
public class BalaDonation {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String donorName;
    
    @Column(nullable = false)
    private BigDecimal donationAmount;
    
    @Column(nullable = false)
    private LocalDate donationDate;
    
    private String purpose;
}