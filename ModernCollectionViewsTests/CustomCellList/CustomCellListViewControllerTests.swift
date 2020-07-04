//  Created by dasdom on 04.07.20.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest
@testable import Modern_Collection_Views

class CustomCellListViewControllerTests: XCTestCase {

    var sut: CustomCellListViewController!

    override func setUpWithError() throws {
        sut = CustomCellListViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_collectionView_isAddedAsSubview() {
        // trigger viewDidLoad
        sut.loadViewIfNeeded()
        
        let isSubview = sut.collectionView.isDescendant(of: sut.view)
        XCTAssertTrue(isSubview)
    }
    
    func test_collectionViewDelegete_isSUT() {
        // trigger viewDidLoad
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.collectionView.delegate as? UIViewController, sut)
    }
    
    func test_cellForItem_returnsCustomListCell() {
        // trigger viewDidLoad
        sut.loadViewIfNeeded()
        
        let cell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: IndexPath(item: 0, section: 0))
        XCTAssertTrue(cell is CustomListCell)
    }
    
    func test_cellForItem_returnsConfiguresCell() {
        let item = Item(category: .music, title: "Foo", description: "Bar")
        sut.items = [item]
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        window.rootViewController = sut
        window.makeKeyAndVisible()
        let nextRunloopExpectation = expectation(description: "Next runloop")
        
        let cell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: IndexPath(item: 0, section: 0)) as! CustomListCell
    
        DispatchQueue.main.async { nextRunloopExpectation.fulfill() }
        waitForExpectations(timeout: 1.0) { error in
            let listContentConfiguration = cell.listContentView.configuration as! UIListContentConfiguration
            XCTAssertEqual(listContentConfiguration.text, item.title)
        }
    }
}
