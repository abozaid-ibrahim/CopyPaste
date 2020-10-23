//
//  NSManagedObject+Dictionary.swift
//  CoreDataTut
//
//  Created by abuzeid on 05.10.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import CoreData
import Foundation
/// make your stuct, classes, models implment this protocol,
/// to save your model attributes  as dictionary
protocol CoreDataCachable {
    var keyValued: [String: Any] { get }
}

// extension NSManagedObject {
//    var toHero: Hero? {
//        guard let id = value(forKeyPath: "id") as? Int,
//            let name = value(forKeyPath: "name") as? String,
//            let thumbnail = value(forKeyPath: "thumbnail") as? String
//        else { return nil }
//        return Hero(id: id,
//                    name: name,
//                    thumbnail: Thumbnail.instance(from: thumbnail))
//    }
// }
//
