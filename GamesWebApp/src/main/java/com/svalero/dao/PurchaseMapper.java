package com.svalero.dao;


import com.svalero.domain.Purchase;
import com.svalero.domain.Game;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PurchaseMapper implements RowMapper<Purchase> {

    @Override
    public Purchase map(ResultSet rs, StatementContext ctx) throws SQLException {

        Game game = GameDAO.getGame(rs.getInt("game_id"));

        return new Purchase(rs.getInt("id"),
                rs.getFloat("price"),
                rs.getString("phone"),
                rs.getString("payment_method"),
                game);
    }
}
