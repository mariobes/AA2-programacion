package com.svalero.dao;

import com.svalero.domain.Game;
import com.svalero.domain.Purchase;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import static com.svalero.dao.Database.db;

public interface GameDAO {

    @SqlUpdate("INSERT INTO games (name, developer, game_18, release_date) VALUES (?, ?, ?, ?)")
    void registerGame(String name, String developer, char game_18, LocalDate release_date);

    @SqlUpdate("UPDATE games SET name = ?, developer = ?, game_18 = ?, release_date = ? WHERE name = ? AND developer = ?")
    void modifyGame(String name, String developer, char game_18, LocalDate release_date, String previousName, String previousDeveloper);

    @SqlQuery("SELECT * FROM games WHERE name = ?")
    @UseRowMapper(GameMapper.class)
    List<Game> searchGame(String name);

    @SqlUpdate("DELETE FROM games WHERE id = ?")
    void deleteGame(int id);

    @SqlQuery("SELECT * FROM games")
    @UseRowMapper(GameMapper.class)
    List<Game> getAllGames();

    static boolean isGame(String name, String developer) {

        String sql = "SELECT COUNT(*) FROM games WHERE name = ? AND developer = ?";

        long count = db.createQuery(sql)
                .bind(0, name)
                .bind(1, developer)
                .mapTo(Long.class)
                .one();

        return count != 0;
    }

    static Game getGame(String name, String developer) {
        String sql = "SELECT * FROM games WHERE name = ? AND developer = ?";

        Game game = db.createQuery(sql)
                .bind(0, name)
                .bind(1, developer)
                .mapToBean(Game.class)
                .one();

//        String purchaseSql = "SELECT * FROM purchases WHERE game_id = ?";
//        List<Purchase> purchases = db.createQuery(purchaseSql)
//                .bind(0, game.getId())
//                .mapToBean(Purchase.class)
//                .list();
//        game.setPurchases(purchases);

        return game;
    }

    static Game getGame(int id) {
        String sql = "SELECT * FROM games WHERE id = ?";

        return db.createQuery(sql)
                .bind(0, id)
                .mapToBean(Game.class)
                .one();
    }

}
