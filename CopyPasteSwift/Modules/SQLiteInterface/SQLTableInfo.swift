//
//  SQLTableInfo.swift

//
//  Created by abuzeid on 11/21/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
protocol SQLTable {
    static var createStatement: String { get }
    //   "INSERT INTO CategoryItem (Id, Name, visits) VALUES (?, ?, ?);"
    var insertStatement: String { get }
    var updateStatement:String{get }//        let updateStatementString = "UPDATE CategoryItem SET visits = '\(newVisits)' WHERE Id = \(id);"

}
