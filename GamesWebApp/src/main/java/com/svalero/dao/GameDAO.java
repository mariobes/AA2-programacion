package com.svalero.dao;

import com.svalero.domain.Game;
import com.svalero.domain.Purchase;
import org.jdbi.v3.sqlobject.customizer.Bind;
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

    @SqlQuery("SELECT * FROM games WHERE name like ? or developer like ?")
    @UseRowMapper(GameMapper.class)
    List<Game> searchGameByNameOrDeveloper(@Bind("name") String name, @Bind("developer") String developer);

    @SqlUpdate("DELETE FROM games WHERE id = ?")
    void deleteGame(int id);

    @SqlQuery("SELECT * FROM games")
    @UseRowMapper(GameMapper.class)
    List<Game> getAllGames();

    @SqlQuery("SELECT * FROM games WHERE id = ?")
    @UseRowMapper(GameMapper.class)
    Game getGame(int id);

}
