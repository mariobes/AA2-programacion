package com.svalero.dao;

import com.svalero.domain.Game;
import com.svalero.util.DateUtils;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;


public class GameMapper implements RowMapper<Game> {

    @Override
    public Game map(ResultSet rs, StatementContext ctx) throws SQLException {

        return new Game(rs.getInt("id"),
                rs.getString("name"),
                rs.getString("developer"),
                rs.getString("game_18").charAt(0),
                DateUtils.getLocalDate(rs.getDate("release_date")),
                rs.getString("image"));
    }
}
