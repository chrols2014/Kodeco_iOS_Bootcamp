import Foundation

var greeting = "Hello, playground"


struct CatFact: Codable {
  let fact: String
  let length: Int32
}


//struct CatFactSequence: AsyncSequence {
//  typealias AsyncIterator = CatFactIterator
//  typealias Element = CatFact
//
//  func makeAsyncIterator() -> CatFactIterator {
//    return CatFactIterator()
//  }
//
//}
//
//
//struct CatFactIterator: AsyncIteratorProtocol {
//  typealias Element = CatFact
//  var currentIteration: Int
//  var requestedIteration
//
//  init(currentIteration: Int, requestedIteration: Int) {
//    self.currentIteration = 1
//    self.requestedIteration = requestedIteration
//  }
//
//
//  mutating func next() async throws -> String? {
//    guard currentIteration <= requestedIteration else { return nil }
//    try await Task.sleep(until: .now + .seconds(1), clock: .continuous)
//    defer {
//      //FetchData()
//      currentIteration += currentIteration
//    }
//    return ""
//  }
//
//}

func fetchData() async throws -> CatFact {
  var catFact: CatFact
  guard let url = URL(string: "https://catfact.ninja/fact") else {
    throw CustomErrors.invalidAPIURL
  }
  
  let (data, response) = try await URLSession.shared.data(from: url)
  
  
  guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    throw CustomErrors.invalidAPIResponse
    
  }
  
  do {
    let decoder = JSONDecoder()
    catFact = try decoder.decode(CatFact.self, from: data)
  } catch {
    throw CustomErrors.invalidAPIData
  }
  
  
  
  
  
  return catFact
}
Task {
  try await print(fetchData().fact)
}

//var funFact: CatFact = fetchData()
//print("\(funFact.fact)")


//AsyncSequnce
//Iterator
//GetCatFacts with parameter for how many



enum CustomErrors: Error {
  case invalidAPIURL
  case invalidAPIResponse
  case invalidAPIData
}
