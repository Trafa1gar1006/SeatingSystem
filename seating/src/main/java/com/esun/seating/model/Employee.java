package com.esun.seating.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Column;
import jakarta.persistence.Table;

@Entity
@Table(name = "Employee")
public class Employee {
    @Id
    private String empId;

    private String name;

    private String email;

    @Column(name = "floor_seat_seq")
    private Integer floorSeatSeq;

    // Getters & Setters
}