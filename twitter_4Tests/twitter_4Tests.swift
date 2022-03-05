//
//  twitter_4Tests.swift
//  twitter_4Tests
//
//  Created by Willy Sato on 2022/02/23.
//

import XCTest
@testable import twitter_4

class twitter_4Tests: XCTestCase {

    var post = PostViewController()

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

        try super.tearDownWithError()
    }


    func testExample() throws {

       
        let passedResult = post.validate(text: "text")
        let failResult = post.validate(text: "texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext")
        XCTAssertTrue(passedResult)
        XCTAssertFalse(failResult)

        

    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
