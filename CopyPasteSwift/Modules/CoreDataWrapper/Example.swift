//
//  CoreData+Image.swift
//  CoreDataTut
//
//  Created by abuzeid on 29.09.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import CoreData
import Foundation

struct Image: CoreDataCachable {
    let image: Data
    let url: String
    let date = Date()
    var keyValued: [String: Any] {
        return ["image": image,
                "url": url,
                "date": date]
    }
}

extension NSPredicate {
    static func image(of url: String) -> NSPredicate {
        NSPredicate(format: "url = %@", url)
    }
}
