//
//  Swift.swift
//  SwiftCrash
//
//  Created by Sven Bacia on 25.02.18.
//  Copyright © 2018 Sven Bacia. All rights reserved.
//

import Foundation
import RealmSwift

class Foo: Object {
    let bars = LinkingObjects(fromType: Bar.self, property: "foo")
}

class Bar: Object {
    @objc dynamic var foo: Foo?
    @objc dynamic var string: String?
}

extension Foo {
    var crash: Bool {
        return Array(bars.filter { $0.string == nil }).isEmpty // --> segmentation fault 11
        // return bars.filter { $0.string == nil }.isEmpty --> does not crash
    }
}
