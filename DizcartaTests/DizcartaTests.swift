//
//  DizcartaTests.swift
//  DizcartaTests
//
//  Created by Felipe Brigagão de Almeida on 19/09/22.
//

import XCTest
import SwiftUI
@testable import Dizcarta

final class DizcartaTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadCards() throws {
        let list: CardList? = CardsManager.decodeJson(forName: "cardsMock")
        XCTAssertNotNil(list, "CardList loaded is nil")
    }

}
