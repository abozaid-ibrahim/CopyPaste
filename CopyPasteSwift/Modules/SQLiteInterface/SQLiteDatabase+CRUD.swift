//
//  SQLiteDatabase+CRUD.swift

//
//  Created by abuzeid on 11/21/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
import SQLite3

extension SQLiteDatabase {
    func createTable(table: SQLTable.Type) throws {
        let createTableStatement = try prepareStatement(sql: table.createStatement)
        defer {
            sqlite3_finalize(createTableStatement)
        }
        guard sqlite3_step(createTableStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
        log("\(table) table created.")
    }

    func insert(table: SQLTable) throws {
        let insertStatement = try prepareStatement(sql: table.insertStatement)
        defer {
            sqlite3_finalize(insertStatement)
        }
        /// loop over insert itmes and bind them to table row.
//        let title: NSString = NSString(string: cat.title)
//
//        guard sqlite3_bind_text(insertStatement, 1, cat.id, -1, nil) == SQLITE_OK,
//            sqlite3_bind_text(insertStatement, 2, title.utf8String, -1, nil) == SQLITE_OK,
//            sqlite3_bind_int(insertStatement, 3, Int32(cat.visitsCount ?? 0)) == SQLITE_OK else {
//            throw SQLiteError.Bind(message: errorMessage)
//        }

        guard sqlite3_step(insertStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }

        log("Successfully inserted row.")
    }

    func update(table: SQLTable) throws {
        let insertStatement = try prepareStatement(sql: table.updateStatement)
        defer {
            sqlite3_finalize(insertStatement)
        }

        guard sqlite3_step(insertStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
    }

    func category(id: String) -> SQLTable? {
        let querySql = "SELECT * FROM CategoryItem WHERE Id = ?;"
        guard let queryStatement = try? prepareStatement(sql: querySql) else {
            return nil
        }

        defer {
            sqlite3_finalize(queryStatement)
        }

        guard sqlite3_bind_text(queryStatement, 1, id, -1, nil) == SQLITE_OK else {
            return nil
        }

        guard sqlite3_step(queryStatement) == SQLITE_ROW else {
            return nil
        }

        let id = String(cString: sqlite3_column_text(queryStatement, 0)!)
        let visits = sqlite3_column_int(queryStatement, 2)
        let name = String(cString: sqlite3_column_text(queryStatement, 1)!)
        return nil // return CategoryItem(id: id, visitsCount: Int(visits), title: name)
    }

    func allCategories() -> [SQLTable] {
        let querySql = "SELECT * FROM CategoryItem WHERE 1=1;"
        guard let queryStatement = try? prepareStatement(sql: querySql) else {
            return []
        }

        defer {
            sqlite3_finalize(queryStatement)
        }

        var objList: [SQLTable] = []
        while sqlite3_step(queryStatement) == SQLITE_ROW {
            let id = String(cString: sqlite3_column_text(queryStatement, 0)!)
            let visits = sqlite3_column_int(queryStatement, 2)
            let name = String(cString: sqlite3_column_text(queryStatement, 1)!)
//            let obj = CategoryItem(id: id, visitsCount: Int(visits), title: name)
//            objList.append(obj)
        }

        return objList
    }

    func delete(table: SQLTable) throws {
    }
}
