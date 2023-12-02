//
//  DrinkStore.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-20.
//

import Foundation
import UIKit

class DrinkStore: ObservableObject {
  let localFavouriteDrinksJSONURL = URL(fileURLWithPath: "favouriteslist",
                                        relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")

  let localRecentDrinksJSONURL = URL(fileURLWithPath: "recentslist",
                                     relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")


let apiKey = "" // insert api key here.

  @Published var popularDrinkData: DrinkModel
  @Published var randomDrinkData: DrinkModel
  @Published var favouriteDrinkData: DrinkModel
  @Published var recentlyViewedDrinkData: DrinkModel
  @Published var filteredAllDrinkData: DrinkModel
  @Published var allDrinksData: DrinkModel

  @Published var showingAPIError: Bool = false
  @Published var isFetchingData: Bool = true

  @Published var isLoadingData: Bool = false

  @Published var searchTerm: String = ""
  @Published var isSearching: Bool = false

  init() {
    popularDrinkData = DrinkModel(drinks: [])
    randomDrinkData = DrinkModel(drinks: [])
    favouriteDrinkData = DrinkModel(drinks: [])
    recentlyViewedDrinkData = DrinkModel(drinks: [])
    filteredAllDrinkData = DrinkModel(drinks: [])
    allDrinksData = DrinkModel(drinks: [])
    configuration.urlCache = cache
  }


  // MARK: - Increase Cache Size
  let configuration = URLSessionConfiguration.default
  let cache = URLCache(memoryCapacity: 500_000_000,
                       diskCapacity: 1_000_000_000)

  // MARK: - Filtering Search Results
  func filterSearchResults() {
    filteredAllDrinkData.drinks = allDrinksData.drinks.filter { $0.drinkName.lowercased().contains(searchTerm.lowercased()) }
  }

  // MARK: - Functions for managing recently viewed
  func setRecentlyViewed(drink: Drink) {
    if let index = recentlyViewedDrinkData.drinks.firstIndex(where: { $0.id == drink.id }) {
      let tempDrink = recentlyViewedDrinkData.drinks.remove(at: index)
      recentlyViewedDrinkData.drinks.insert(tempDrink, at: 0)
    } else {
      recentlyViewedDrinkData.drinks.insert(drink, at: 0)
    }
    if recentlyViewedDrinkData.drinks.count > 10 {
      recentlyViewedDrinkData.drinks.removeLast()
    }


    saveRecentsJSON()
  }




  // MARK: - Functions for managing favourites
  func isFavourite(drink: Drink) -> Bool {
    if favouriteDrinkData.drinks.firstIndex(where: { $0.id == drink.id }) != nil {
      return true
    }

    return false
  }

  func toggleFavourite(drink: Drink) {
    if let index = favouriteDrinkData.drinks.firstIndex(where: { $0.id == drink.id }) {
      favouriteDrinkData.drinks.remove(at: index)
      saveFavouritesJSON()
    } else {
      favouriteDrinkData.drinks.append(drink)
      saveFavouritesJSON()
    }
  }

  func makeFavourite(drink: Drink) {

    favouriteDrinkData.drinks.append(drink)
    saveFavouritesJSON()

  }

  // MARK: - Functions related to loading from local JSON
  func loadLocalFavouritesJSON()  {
    var workingDirectory: URL

    if FileManager.default.fileExists(atPath: localFavouriteDrinksJSONURL.path) {

      workingDirectory = localFavouriteDrinksJSONURL
      decodeLocalFavouritesJSON(url: workingDirectory)

    } else {
      showingAPIError = true
    }
  }

  func decodeLocalFavouritesJSON(url: URL) {
    let decoder = JSONDecoder()
    do {
      let favouritesData = try Data(contentsOf: url)
      favouriteDrinkData = try decoder.decode(DrinkModel.self, from: favouritesData)
    } catch let error {
      print(error)
      showingAPIError = true
    }

  }

  func loadLocalRecentsJSON()  {
    var workingDirectory: URL

    if FileManager.default.fileExists(atPath: localRecentDrinksJSONURL.path) {

      workingDirectory = localRecentDrinksJSONURL
      decodeLocalRecentsJSON(url: workingDirectory)

    } else {
      showingAPIError = true
    }
  }

  func decodeLocalRecentsJSON(url: URL) {
    let decoder = JSONDecoder()
    do {
      let recentsData = try Data(contentsOf: url)
      recentlyViewedDrinkData = try decoder.decode(DrinkModel.self, from: recentsData)
    } catch let error {
      showingAPIError = true
    }

  }


  // MARK: - Functions related to saving to local JSON
  private func saveFavouritesJSON() {
    let encoder = JSONEncoder()

    do {
      let favouritesData = try encoder.encode(favouriteDrinkData)
      let favouriteDrinkData = URL(fileURLWithPath: "favouriteslist",
                                   relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")

      try favouritesData.write(to: favouriteDrinkData, options: .atomicWrite)
    } catch let error {
      print(error)

    }
  }

  private func saveRecentsJSON() {
    let encoder = JSONEncoder()

    do {
      let recentsData = try encoder.encode(recentlyViewedDrinkData)
      let recentDrinkData = URL(fileURLWithPath: "recentslist",
                                relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")

      try recentsData.write(to: recentDrinkData, options: .atomicWrite)

    } catch let error {
      print(error)

    }
  }

  // MARK: - API Calls

  func fetchURLData(url: String) async throws -> Data {
    guard let url = URL(string: url) else {
      throw CustomErrors.invalidAPIURL
    }
    let session = URLSession(configuration: configuration)
    let (data, response) = try await session.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw CustomErrors.invalidAPIResponse
    }
    return data
  }

  func decodeURLData(data: Data) throws -> DrinkModel {
    do {
      let decoder = JSONDecoder()

      let decodedDrinkData = try decoder.decode(DrinkModel.self, from: data)

      return decodedDrinkData


    } catch {
      throw CustomErrors.invalidAPIData
    }
  }

  func fetchAllDrinks() async throws {

    let chars = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","v","w","y","z"]

    for char in chars {
      let data = try await fetchURLData(url: "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/search.php?f=\(char)")

      do {
        try await MainActor.run {
          let tempAllDrinkData = try decodeURLData(data: data)
          allDrinksData.drinks.append(contentsOf: tempAllDrinkData.drinks)
          allDrinksData.drinks.sorted { drink1, drink2 in
            drink1.drinkName < drink2.drinkName
          }

        }
      } catch {
        throw CustomErrors.invalidAPIData
      }
    }
  }


  func fetchRandomDrinkAPIData() async throws {
    let data = try await fetchURLData(url: "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/randomselection.php")

    do {
      try await MainActor.run {
        randomDrinkData = try decodeURLData(data: data)

      }
    } catch {
      throw CustomErrors.invalidAPIData
    }

  }

  func fetchPopularDrinkAPIData() async throws {
    await MainActor.run {
    }
    let data = try await fetchURLData(url: "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/popular.php")

    do {
      try await MainActor.run {
        popularDrinkData = try decodeURLData(data: data)
      }
    } catch {
      throw CustomErrors.invalidAPIData
    }
  }

}
enum CustomErrors: Error {
  case invalidAPIURL
  case invalidAPIResponse
  case invalidAPIData
}
