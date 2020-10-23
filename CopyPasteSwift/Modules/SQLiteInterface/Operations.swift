//
//  Operations.swift
//  CopyPasteSwift
//
//  Created by abuzeid on 23.10.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import Foundation
protocol CachingOperator {
    func insert(table: SQLTable) throws
    func update(table: SQLTable) throws
    func delete(table: SQLTable) throws
}
