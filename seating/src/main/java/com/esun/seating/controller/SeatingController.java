package com.esun.seating.controller;

import org.springframework.web.bind.annotation.RestController;

import com.esun.seating.service.SeatingService;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import java.util.Map;


@RestController
@RequestMapping("/api/seating")
public class SeatingController {

    @Autowired
    private SeatingService service;

    @GetMapping
    public ResponseEntity<?> getSeating() {
        return ResponseEntity.ok(service.getSeatingInfo());
    }

    @PostMapping("/assign")
    public ResponseEntity<?> assignSeat(@RequestBody Map<String, Object> req) {
        String empId = (String) req.get("empId");
        Integer seatSeq = (Integer) req.get("seatSeq");
        service.updateSeat(empId, seatSeq);
        return ResponseEntity.ok("更新成功");
    }
}

