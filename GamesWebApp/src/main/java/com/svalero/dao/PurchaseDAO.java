package com.svalero.dao;


import com.svalero.domain.Game;
import com.svalero.domain.Purchase;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.SQLException;
import java.util.List;

import static com.svalero.dao.Database.db;

public interface PurchaseDAO {

    @SqlUpdate("INSERT INTO purchases (price, phone, payment_method, game_id) VALUES (?, ?, ?, ?)")
    void registerPurchase(float price, String phone, String payment_method, int game_id);

    @SqlUpdate("UPDATE purchases SET price = ?, phone = ?, payment_method = ?, game_id = ? WHERE id = ?")
    void modifyPurchase(float price, String phone, String payment_method, int game_id, String id);

    @SqlQuery("SELECT * FROM purchases where game_id = ?")
    @UseRowMapper(PurchaseMapper.class)
    List<Purchase> searchPurchase(int game_id);

    @SqlUpdate("DELETE FROM purchases WHERE id = ?")
    void deletePurchase(int id);

    @SqlQuery("SELECT * FROM purchases")
    @UseRowMapper(PurchaseMapper.class)
    List<Purchase> getAllPurchases();

    @SqlQuery("SELECT * FROM purchases WHERE id = ?")
    @UseRowMapper(PurchaseMapper.class)
    Purchase getPurchase(int id);

}
