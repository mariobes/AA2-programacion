package com.svalero.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import static com.svalero.util.Constants.*;

public class Database {

    public static Jdbi jdbi;
    public static Handle db;

    public static void connect() {
        jdbi = Jdbi.create(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD);
        jdbi.installPlugin(new SqlObjectPlugin());
        db = jdbi.open();
    }

    public static void disconnect() {
        db.close();
    }

}
