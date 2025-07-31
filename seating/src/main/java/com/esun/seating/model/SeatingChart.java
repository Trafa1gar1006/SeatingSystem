package com.esun.seating.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Column;
import jakarta.persistence.Table;


@Entity
@Table(name = "SeatingChart")
public class SeatingChart {
    @Id
    @Column(name = "floor_seat_seq")
    private Integer floorSeatSeq;

    private String floorNo;
    private String seatNo;

    // Getters & Setters
}
