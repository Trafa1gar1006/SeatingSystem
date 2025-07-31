package com.esun.seating.Repository;

import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.List;
import java.util.Map;


@Repository
public class SeatingRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> getAllSeating() {
        return jdbcTemplate.queryForList("CALL GetAllSeating()");
    }

    public void assignSeat(String empId, int floorSeatSeq) {
        jdbcTemplate.update("CALL AssignSeat(?, ?)", empId, floorSeatSeq);
    }

    public void clearSeat(String empId) {
        jdbcTemplate.update("CALL ClearSeat(?)", empId);
    }
}
