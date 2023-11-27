//
//  DrinkStore.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-20.
//

import Foundation

class DrinkStore: ObservableObject {
  
  @Published var loadedDrinkData: DrinkModel
  @Published var popularDrinkData: DrinkModel
  @Published var randomDrinkData: DrinkModel


  init() {
    loadedDrinkData = DrinkModel(drinks: [])
    popularDrinkData = DrinkModel(drinks: [])
    randomDrinkData = DrinkModel(drinks: [])
  }
  
  func fetchAPIData() async throws {
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
