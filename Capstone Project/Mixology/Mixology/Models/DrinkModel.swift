//
//  Drink.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-20.
//

import Foundation

struct DrinkModel: Codable {
  var drinks: [Drink]


}

struct Drink: Codable, Identifiable, Hashable {
  let id: String
  let drinkName: String
  let strDrinkAlternate: String?
  let tags: String?
  let strVideo: String?
  let category: String?
  let strIBA: String?
  let strAlcoholic: String?
  let glass: String?
  let instructions: String?
  let strInstructionsES: String?
  let strInstructionsDE: String?
  let strInstructionsFR: String?
  let strInstructionsIT: String?
  let strInstructionsZHHANS: String?
  let strInstructionsZHHANT: String?
  let imageURL: URL
  let ingredient1: String?
  let ingredient2: String?
  let ingredient3: String?
  let ingredient4: String?
  let ingredient5: String?
  let ingredient6: String?
  let ingredient7: String?
  let ingredient8: String?
  let ingredient9: String?
  let ingredient10: String?
  let ingredient11: String?
  let ingredient12: String?
  let ingredient13: String?
  let ingredient14: String?
  let ingredient15: String?
  let ingredientMeasure1: String?
  let ingredientMeasure2: String?
  let ingredientMeasure3: String?
  let ingredientMeasure4: String?
  let ingredientMeasure5: String?
  let ingredientMeasure6: String?
  let ingredientMeasure7: String?
  let ingredientMeasure8: String?
  let ingredientMeasure9: String?
  let ingredientMeasure10: String?
  let ingredientMeasure11: String?
  let ingredientMeasure12: String?
  let ingredientMeasure13: String?
  let ingredientMeasure14: String?
  let ingredientMeasure15: String?
  let strImageSource: String?
  let strImageAttribution: String?
  let strCreativeCommonsConfirmed: String?
  let dateModified: String?
  
  var isFavourite: Bool {
    return true
  }

  var tagsArray: [String] {
    var tempArray: [String] = []
    if let tags = tags {
      if tags.contains(" ") {
      tempArray = tags.components(separatedBy: " ")
      } else if tags.contains(",") {
      tempArray = tags.components(separatedBy: ",")
      }
                  
      
      
      
    }
    return tempArray
    
    
    
  }


  var ingredientArray: [String] {
    var tempArray: [String] = []
    if let temp = ingredient1 {
      tempArray.append(temp)
    }
    if let temp = ingredient2 {
      tempArray.append(temp)
    }
    if let temp = ingredient3 {
      tempArray.append(temp)
    }
    if let temp = ingredient4 {
      tempArray.append(temp)
    }
    if let temp = ingredient5 {
      tempArray.append(temp)
    }
    if let temp = ingredient6 {
      tempArray.append(temp)
    }
    if let temp = ingredient7 {
      tempArray.append(temp)
    }
    if let temp = ingredient8 {
      tempArray.append(temp)
    }
    if let temp = ingredient9 {
      tempArray.append(temp)
    }
    if let temp = ingredient10 {
      tempArray.append(temp)
    }
    if let temp = ingredient11 {
      tempArray.append(temp)
    }
    if let temp = ingredient12 {
      tempArray.append(temp)
    }
    if let temp = ingredient13 {
      tempArray.append(temp)
    }
    if let temp = ingredient14 {
      tempArray.append(temp)
    }
    if let temp = ingredient15 {
      tempArray.append(temp)
    }
    return tempArray
  }

  var measurementsArray: [String] {
    var tempArray: [String] = []
    if let temp: String = ingredientMeasure1 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure2 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure3 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure4 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure5 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure6 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure7 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure8 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure9 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure10 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure11 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure12 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure13 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure14 {
      tempArray.append(temp)
    }
    if let temp: String = ingredientMeasure15 {
      tempArray.append(temp)
    }
    return tempArray
  }



  private enum CodingKeys: String, CodingKey {
    case id = "idDrink"
    case drinkName = "strDrink"
    case strDrinkAlternate
    case tags = "strTags"
    case strVideo
    case category = "strCategory"
    case strIBA
    case strAlcoholic
    case glass = "strGlass"
    case instructions = "strInstructions"
    case strInstructionsES
    case strInstructionsDE
    case strInstructionsFR
    case strInstructionsIT
    case strInstructionsZHHANS = "strInstructionsZH-HANS"
    case strInstructionsZHHANT = "strInstructionsZH-HANT"
    case imageURL = "strDrinkThumb"
    case ingredient1 = "strIngredient1"
    case ingredient2 = "strIngredient2"
    case ingredient3 = "strIngredient3"
    case ingredient4 = "strIngredient4"
    case ingredient5 = "strIngredient5"
    case ingredient6 = "strIngredient6"
    case ingredient7 = "strIngredient7"
    case ingredient8 = "strIngredient8"
    case ingredient9 = "strIngredient9"
    case ingredient10 = "strIngredient10"
    case ingredient11 = "strIngredient11"
    case ingredient12 = "strIngredient12"
    case ingredient13 = "strIngredient13"
    case ingredient14 = "strIngredient14"
    case ingredient15 = "strIngredient15"
    case ingredientMeasure1 = "strMeasure1"
    case ingredientMeasure2 = "strMeasure2"
    case ingredientMeasure3 = "strMeasure3"
    case ingredientMeasure4 = "strMeasure4"
    case ingredientMeasure5 = "strMeasure5"
    case ingredientMeasure6 = "strMeasure6"
    case ingredientMeasure7 = "strMeasure7"
    case ingredientMeasure8 = "strMeasure8"
    case ingredientMeasure9 = "strMeasure9"
    case ingredientMeasure10 = "strMeasure10"
    case ingredientMeasure11 = "strMeasure11"
    case ingredientMeasure12 = "strMeasure12"
    case ingredientMeasure13 = "strMeasure13"
    case ingredientMeasure14 = "strMeasure14"
    case ingredientMeasure15 = "strMeasure15"
    case strImageSource
    case strImageAttribution
    case strCreativeCommonsConfirmed
    case dateModified
  }
}



struct MockData {
  
  let mockDrink: Drink = Drink(id: "13731",
                               drinkName: "Amaretto Sour",
                               strDrinkAlternate: "",
                               tags: "testTag1, testTag2",
                               strVideo: nil,
                               category: "Ordinary Drink",
                               strIBA: nil,
                               strAlcoholic: "Alcoholic",
                               glass: "Collins Glass",
                               instructions: "Shake and strain. Garnish with a cherry and an orange slice.",
                               strInstructionsES: nil,
                               strInstructionsDE: nil,
                               strInstructionsFR: nil,
                               strInstructionsIT: nil,
                               strInstructionsZHHANS: nil,
                               strInstructionsZHHANT: nil,
                               imageURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/xnzc541493070211.jpg")!,
                               ingredient1: "Amaretto",
                               ingredient2: "Sour mix",
                               ingredient3: nil,
                               ingredient4: nil,
                               ingredient5: nil,
                               ingredient6: nil,
                               ingredient7: nil,
                               ingredient8: nil,
                               ingredient9: nil,
                               ingredient10: nil,
                               ingredient11: nil,
                               ingredient12: nil,
                               ingredient13: nil,
                               ingredient14: nil,
                               ingredient15: nil,
                               ingredientMeasure1: "1 1/2 oz",
                               ingredientMeasure2: "3 oz",
                               ingredientMeasure3: nil,
                               ingredientMeasure4: nil,
                               ingredientMeasure5: nil,
                               ingredientMeasure6: nil,
                               ingredientMeasure7: nil,
                               ingredientMeasure8: nil,
                               ingredientMeasure9: nil,
                               ingredientMeasure10: nil,
                               ingredientMeasure11: nil,
                               ingredientMeasure12: nil,
                               ingredientMeasure13: nil,
                               ingredientMeasure14: nil,
                               ingredientMeasure15: nil,
                               strImageSource: nil,
                               strImageAttribution: nil,
                               strCreativeCommonsConfirmed: "No",
                               dateModified: "2017-04-24 22:43:32")
  
   let mock = DrinkModel.init(drinks: [Drink.init(id: "178306", drinkName: "Slippery Nipple", strDrinkAlternate: nil, tags: "Adult", strVideo: nil, category: "Shot", strIBA: nil, strAlcoholic: "Alcoholic", glass: "Shot glass", instructions: "Pour the Sambuca into a shot glass, then pour the Irish Cream on top so that the two liquids do not mix.", strInstructionsES: nil, strInstructionsDE: nil, strInstructionsFR: nil, strInstructionsIT: "Versare la Sambuca in un bicchierino, quindi versarvi sopra l'Irish Cream in modo che i due liquidi non si mescolino.", strInstructionsZHHANS: nil, strInstructionsZHHANT: nil, imageURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/l9tgru1551439725.jpg")!, ingredient1: "Sambuca", ingredient2: "Irish cream", ingredient3: nil, ingredient4: nil, ingredient5: nil, ingredient6: nil, ingredient7: nil, ingredient8: nil, ingredient9: nil, ingredient10: nil, ingredient11: nil, ingredient12: nil, ingredient13: nil, ingredient14: nil, ingredient15: nil, ingredientMeasure1: "1 part", ingredientMeasure2: "1 part", ingredientMeasure3: nil, ingredientMeasure4: nil, ingredientMeasure5: nil, ingredientMeasure6: nil, ingredientMeasure7: nil, ingredientMeasure8: nil, ingredientMeasure9: nil, ingredientMeasure10: nil, ingredientMeasure11: nil, ingredientMeasure12: nil, ingredientMeasure13: nil, ingredientMeasure14: nil, ingredientMeasure15: nil, strImageSource: nil, strImageAttribution: nil, strCreativeCommonsConfirmed: "No", dateModified: "2019-03-01 11:28:45")])

}
