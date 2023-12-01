//
//  DrinkStore.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-20.
//

import Foundation

class DrinkStore: ObservableObject {
  let apiJSONDocumentsDirURL = URL(fileURLWithPath: "favouriteslist",
                                   relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")

  @Published var loadedDrinkData: DrinkModel
  @Published var popularDrinkData: DrinkModel
  @Published var randomDrinkData: DrinkModel
  @Published var favouriteDrinkData: DrinkModel

  @Published var showingAPIError: Bool = false
  @Published var isFetchingData: Bool = true

  init() {
    loadedDrinkData = DrinkModel(drinks: [])
    popularDrinkData = DrinkModel(drinks: [])
    randomDrinkData = DrinkModel(drinks: [])
    favouriteDrinkData = DrinkModel(drinks: [])
    //    URLCache.shared.memoryCapacity = 10_000_000 // ~10 MB memory space
    //    URLCache.shared.diskCapacity = 1_000_000_000 // ~1GB disk cache space
  }

  //  func toggleIsFavourite(drink: Drink) {
  //    if let index = drinks.firstIndex(where: { $0.id == drinks.id }) {
  //      drinks[index].isFavourite.toggle()
  //    }
  //  }

  // MARK: - Functions for managing favourites
  func isFavourite(drink: Drink) -> Bool {
    if let index = favouriteDrinkData.drinks.firstIndex(where: { $0.id == drink.id }) {
      return true
    }

    return false
  }

  func toggleFavourite(drink: Drink) {
    if let index = favouriteDrinkData.drinks.firstIndex(where: { $0.id == drink.id }) {
      print("removing \(favouriteDrinkData.drinks[index].drinkName) from favourites")
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

    if FileManager.default.fileExists(atPath: apiJSONDocumentsDirURL.path) {
      print("API file not in bundle but found in documents directory")

      workingDirectory = apiJSONDocumentsDirURL
      decodeLocalJSON(url: workingDirectory)

    } else {
      print("API file not found in either directory")
      showingAPIError = true
    }
  }

  func decodeLocalJSON(url: URL) {
    let decoder = JSONDecoder()
    do {
      let favouritesData = try Data(contentsOf: url)
      favouriteDrinkData = try decoder.decode(DrinkModel.self, from: favouritesData)
      print("Loaded favourites from disk")
    } catch let error {
      print(error)
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
      print("saved favourites to local file")
    } catch let error {
      print(error)

    }
  }

  // MARK: - API Calls

  func fetchAPIData() async throws {
    await MainActor.run {
      //isFetchingData = true
    }

    guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v2/9973533/search.php?f=b") else {
      //guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v2/9973533/randomselection.php") else {

      // guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v2/9973533/random.php") else {
      throw CustomErrors.invalidAPIURL
    }

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw CustomErrors.invalidAPIResponse
    }


    do {
      let decoder = JSONDecoder()
      try await MainActor.run {
        loadedDrinkData = try decoder.decode(DrinkModel.self, from: data)
        //saveAPIJSON()
        //isFetchingData = false
        print("Fetched \(loadedDrinkData.drinks.count) results.")
        //print("\(loadedDrinkData.drinks.first?.strDrink)")
      }
    } catch {
      throw CustomErrors.invalidAPIData

    }
  }

  func fetchRandomDrinkAPIData() async throws {
    await MainActor.run {
      //isFetchingData = true
    }

    //    guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v2/9973533/search.php?f=b") else {
    guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v2/9973533/randomselection.php") else {

      // guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v2/9973533/random.php") else {
      throw CustomErrors.invalidAPIURL
    }

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw CustomErrors.invalidAPIResponse
    }


    do {
      let decoder = JSONDecoder()
      try await MainActor.run {
        randomDrinkData = try decoder.decode(DrinkModel.self, from: data)
        //saveAPIJSON()
        //isFetchingData = false
        print("Fetched \(randomDrinkData.drinks.count) random results.")
        //print("\(loadedDrinkData.drinks.first?.strDrink)")
      }
    } catch {
      throw CustomErrors.invalidAPIData

    }
  }

  func fetchPopularDrinkAPIData() async throws {
    await MainActor.run {
      //isFetchingData = true
    }

    //    guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v2/9973533/search.php?f=b") else {
    guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v2/9973533/popular.php") else {

      // guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v2/9973533/random.php") else {
      throw CustomErrors.invalidAPIURL
    }

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw CustomErrors.invalidAPIResponse
    }


    do {
      let decoder = JSONDecoder()
      try await MainActor.run {
        popularDrinkData = try decoder.decode(DrinkModel.self, from: data)
        //saveAPIJSON()
        //isFetchingData = false
        print("Fetched \(popularDrinkData.drinks.count) popular results.")
        //print("\(loadedDrinkData.drinks.first?.strDrink)")
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
