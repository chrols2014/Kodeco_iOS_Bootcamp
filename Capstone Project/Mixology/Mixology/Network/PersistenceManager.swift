//
//  PersistenceManager.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-30.
//

import Foundation


class PersistenceManager {

  //static private let defaults = UserDefaults.standard

  func saveFavourites(favourites: [Drink]) {
    do {
        // 1
        let encodedData = try JSONEncoder().encode(favourites)


        let userDefaults = UserDefaults.standard
        // 2
        userDefaults.set(encodedData, forKey: "favourites")

    } catch {
        // Failed to encode Contact to Data
    }

  }

  func loadFavourites() {
    let userDefaults = UserDefaults.standard
    if let savedData = userDefaults.object(forKey: "favourites") as? Data {

        do{
            // 2
            let savedContacts = try JSONDecoder().decode([Drink].self, from: savedData)

        } catch {
            // Failed to convert Data to Contact
        }
    }

  }



}
