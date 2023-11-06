import Foundation

//MARK: - Call Site
fetchMeSomeCatFacts(numberOfFactsToGet: 10)



// MARK: - CatFact Model for Decoding
struct CatFact: Codable {
  let fact: String
  let length: Int32
}


// MARK: - AsyncSequence
struct CatFactSequence: AsyncSequence {
  typealias AsyncIterator = CatFactIterator
  typealias Element = CatFact
  
  let requestedIterations: Int
  
  func makeAsyncIterator() -> CatFactIterator {
    return CatFactIterator(requestedIterations)
  }
}


// MARK: - Iterator
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
    try await currentCatFact = fetchData()
    try await Task.sleep(until: .now + .seconds(0.5), clock: .continuous)
    defer {
      currentIteration += 1
    }
    return currentCatFact
  }
}


// MARK: - APICall
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


// MARK: - Cat Fact Getter Function
func fetchMeSomeCatFacts(numberOfFactsToGet: Int) {
  if numberOfFactsToGet <= 0 {
    print("~ Enter in a number to see the cat facts! 😿 ~")
  }
  else {
    print("~ Getting those cat facts! 😸 ~")
    Task {
      for try await item in CatFactSequence(requestedIterations: numberOfFactsToGet) {
        print("~ \(item.fact) ~")
      }
    }
  }
}


// MARK: - Custom Errors
enum CustomErrors: Error {
  case invalidAPIURL
  case invalidAPIResponse
  case invalidAPIData
}
