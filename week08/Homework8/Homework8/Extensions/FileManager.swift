import Foundation

public extension FileManager {
  static var documentsDirectoryURL: URL {
    return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
  
  static var bundleURL: URL {
    return Bundle.main.bundleURL
  }
}
