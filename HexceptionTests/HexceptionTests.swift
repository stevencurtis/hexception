//
//  HexceptionTests.swift
//  HexceptionTests
//
//  Created by Steven Curtis on 23/01/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import XCTest
@testable import Hexception

class HexceptionTests: XCTestCase {

    var game: GameLogic!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = GameLogic()
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
    
    func testsetupGame() {
        XCTAssertEqual(game.setupGame(number: 1).correctAnswer, UIColor.red)
        XCTAssertEqual(UIColor.red.hexString, "FF0000")

    }

}
