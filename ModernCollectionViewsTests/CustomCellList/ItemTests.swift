//  Created by dasdom on 04.07.20.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest
@testable import Modern_Collection_Views

class ItemTests: XCTestCase {

    func test_initWithImageName() {
        let item = Item(category: .music, imageName: "headphones", title: "Foo", description: "Bar")
        XCTAssertNotNil(item.image)
    }
    
    func test_initWithWrongImageName() {
        let item = Item(category: .music, imageName: "42foobar", title: "Foo", description: "Bar")
        XCTAssertNil(item.image)
    }
    
    func test_initWithoutImageName() {
        let item = Item(category: .music, title: "Foo", description: "Bar")
        XCTAssertNil(item.image)
    }
}
