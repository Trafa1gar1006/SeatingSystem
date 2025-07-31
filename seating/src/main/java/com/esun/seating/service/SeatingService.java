package com.esun.seating.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.esun.seating.Repository.SeatingRepository;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.List;
import java.util.Map;



@Service
public class SeatingService {

    @Autowired
    private SeatingRepository repo;
    private JdbcTemplate jdbcTemplate;

    @Transactional
    public void updateSeat(String empId, Integer newSeatSeq) {
        repo.clearSeat(empId); // 清除舊座位
        repo.assignSeat(empId, newSeatSeq); // 指派新座位
    }

    public void assignSeat(String empId, int floorSeatSeq) {
        String sql = "UPDATE Employee SET FLOOR_SEAT_SEQ = ? WHERE EMP_ID = ?";
        jdbcTemplate.update(sql, floorSeatSeq, empId); // 預處理 → 自動防注入
    }
    public List<Map<String, Object>> getSeatingInfo() {
        return repo.getAllSeating();
    }
}
