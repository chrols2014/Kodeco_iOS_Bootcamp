//
//  DrinkStoreTests.swift
//  MixologyTests
//
//  Created by Chris Olsen on 2023-12-01.
//

import XCTest



final class DrinkStoreTests: XCTestCase {
    let url = Bundle.main.url(forResource: "mockDrink", withExtension: "json")!

    let vm = DrinkStore()

    func test_decodeLocalFavouritesValid() {
        vm.decodeLocalFavouritesJSON(url: url)

     // XCTAssertEqual(vm.favouriteDrinkData, MockData)

    }

    func test_decodeLocalFavouritesInvalid() {
        let url = Bundle.main.url(forResource: "mock", withExtension: "json")!

        vm.decodeLocalFavouritesJSON(url: url)

        XCTAssertTrue(vm.showingAPIError)
    }

    func test_loadLocalFavourites() {
        vm.loadLocalFavouritesJSON()

        XCTAssert(vm.showingAPIError)
    }

}
