//
//  CoreDataGetTests.swift
//  DizcartaTests
//
//  Created by Igor Samoel da Silva on 05/10/22.
//

import XCTest
@testable import Dizcarta

final class CoreDataGetTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetPlayers() throws {
        let repository = PlayerRepositoryMock(context: PersistenceController.inMemoryContext)
        let match = repository.createMatch()
        for _ in 0...9 {
            repository.createPlayer(name: UUID().uuidString, avatar: UUID().uuidString, match: match)
        }
        XCTAssertTrue(10 == repository.getPlayers(match: match).count, "Different amount of players than created")
    }
}
