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
    
    //MARK:- Unit test For testing DataInfoViewModel
    func testDataInfoModel() {
       
        //Model Object for passing test case
        let objRowInfo = RowInfo(title: "Toronto", description: "The city of Canada", imageHref: "http://www.image")
        
        //Model Object for failing test case
        //let objRowInfo = RowInfo(title: "Toronto", description: nil, imageHref: nil)
        let objViewModel = DataInfoViewModel(dataInfo: objRowInfo)
        
        XCTAssertEqual(objRowInfo.title, objViewModel.title)
        XCTAssertEqual(objRowInfo.description, objViewModel.description)
        XCTAssertEqual(objRowInfo.imageHref, objViewModel.imageInfo)
    }
    
    //MARK:- Unit Test For Api data fecth call
    func testApiDataFetch() {
        //let str = "About" // Result for Failing Test Case
        let str = "About Canada" // Result for passing Test Case
       
        let expectation = self.expectation(description: str)
        
        NetworkApiManager.sharedNetworkApiManager.getDataFromUrl(BaseUrlPath) { (dt: DataInfo?, err: Error?) in
            if let error = err{
                XCTFail("Failed with error\(error.localizedDescription)")
            }
            if let data = dt{
                if data.title == str{
                    expectation.fulfill()
                }else{
                    XCTFail("Failed with data is not equal")
                }
            }
        }
        
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    

}
