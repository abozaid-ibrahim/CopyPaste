//
//  CoreDataIOType.swift
//  CopyPasteSwift
//
//  Created by abuzeid on 23.10.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import CoreData
import Foundation
typealias Complation = ((Bool) -> Void)

protocol CoreDataIOType {
    func clearCache(for entity: TableName, where predicate: NSPredicate?)
    func load(offset: Int, entity: TableName, predicate: NSPredicate?) -> [NSManagedObject]
    func save<T: CoreDataCachable>(data: [T], entity: TableName, onComplete: Complation?)
}
