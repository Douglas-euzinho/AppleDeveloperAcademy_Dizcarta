//
//  UtilsFunctionsTest.swift
//  DizcartaTests
//
//  Created by Igor Samoel da Silva on 04/10/22.
//

import XCTest
@testable import Dizcarta
import SwiftUI

final class UtilsFunctionsTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testColorName() throws {
        let correctColor = Color(.avatarColorBlue)
        let wrongColor = Color(.avatarColorCopperRose)
        XCTAssertTrue(AppColor.colorName(correctColor) == AppColor.avatarColorBlue.rawValue, "The obtained color name is different from the existing color in AppColor")
        XCTAssertTrue(AppColor.colorName(wrongColor) != AppColor.avatarColorBlue.rawValue, "The obtained color name is different from the existing color in AppColor")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
