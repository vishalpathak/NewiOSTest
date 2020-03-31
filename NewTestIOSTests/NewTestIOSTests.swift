//
//  NewTestIOSTests.swift
//  NewTestIOSTests
//
//  Created by Borqs India on 15/03/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import XCTest
@testable import NewTestIOS

class NewTestIOSTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDataInfoModel() {
        //let newTitle = "toronto" + " "
        let objRowInfo = RowInfo(title: "Toronto", description: "It is big city in Canada", imageHref: "http://newimg.com")
        let objViewModel = DataInfoViewModel(dataInfo: objRowInfo)
        
        XCTAssertEqual(objRowInfo.title, objViewModel.title)
    }

}
