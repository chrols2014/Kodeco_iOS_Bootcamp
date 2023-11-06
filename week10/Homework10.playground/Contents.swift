import Foundation

struct CatFact: Codable {
  let fact: String
  let length: Int32
}


struct CatFactSequence: AsyncSequence {
  typealias AsyncIterator = CatFactIterator
  typealias Element = CatFact

  let requestedIterations: Int
  
  func makeAsyncIterator() -> CatFactIterator {
    return CatFactIterator(requestedIterations)
  }

}

struct CatFactIterator: AsyncIteratorProtocol {
  typealias Element = CatFact
  var currentIteration: Int
  var requestedIterations: Int
  var currentCatFact: CatFact?

  init(_ requestedIterations: Int) {
    self.currentIteration = 0
    self.requestedIterations = requestedIterations
  }

  mutating func next() async throws -> CatFact? {
    guard currentIteration <= requestedIterations - 1 else { return nil }
    try await Task.sleep(until: .now + .seconds(1), clock: .continuous)
    try await currentCatFact = fetchData()
    defer {
      currentIteration += 1
    }
    return currentCatFact
  }

}

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
  for try await item in CatFactSequence(requestedIterations: 10) {
    print(item.fact)
  }
  
}


enum CustomErrors: Error {
  case invalidAPIURL
  case invalidAPIResponse
  case invalidAPIData
}
