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
        let match = repository.createMatch()
        repository.createPlayer(name: "PlayerTest", avatar: "IconTest", match: match)
        let player = repository.getPlayers(match: match).first
        XCTAssertTrue(player?.name == "PlayerTest", "Player Name different from the one created by the test")
        XCTAssertTrue(player?.avatar == "IconTest", "Player Icon different from the one created by the test")
    }

}
