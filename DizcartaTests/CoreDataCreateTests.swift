//
//  CoreDataCreateTests.swift
//  DizcartaTests
//
//  Created by Igor Samoel da Silva on 05/10/22.
//

import XCTest
@testable import Dizcarta

final class CoreDataCreateTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreatePlayer() throws {
        let context = PersistenceController.inMemoryContext
        let repository = PlayerRepositoryCoreData(context: context)
        repository.createPlayer(name: "PlayerTest", avatar: "IconTest")
        let player = repository.getPlayers().first
        XCTAssertTrue(player?.name == "PlayerTest", "Player Name different from the one created by the test")
        XCTAssertTrue(player?.avatar == "IconTest", "Player Icon different from the one created by the test")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
