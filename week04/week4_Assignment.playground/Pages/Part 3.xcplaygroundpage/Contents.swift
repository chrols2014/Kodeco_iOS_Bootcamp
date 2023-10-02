//: [Previous](@previous)
/*
Chris Olsen
Assignment 4, Part 3 - Above and Beyond
*/

import Foundation

protocol Shape {
  func calculateArea() -> Double
}

extension Shape {
  func calculateVolume(radius: Double) -> Double {
    let volume = (4/3) * Double.pi * pow(radius, 3)
    return volume
  }
}

struct Circle: Shape {
  var diameter: Double
  var radius: Double {
    return diameter / 2
  }
  func calculateArea() -> Double {
    let area = (radius * radius) * Double.pi
    return area
  }
}

struct Rectangle: Shape {
  let length: Double
  let width: Double
  func calculateArea() -> Double {
    return length * width
  }
}

struct Sphere: Shape {
  var diameter: Double
  var radius: Double {
    return diameter / 2
  }
  func calculateArea() -> Double {
    let area = (radius * radius) * Double.pi
    return area
  }
  var volume: Double {
    calculateVolume(radius: radius)
  }
}

let newCircle = Circle(diameter: 6)
print("Circle Area: \(String(format: "%.4f", newCircle.calculateArea()))")


let newRectangle = Rectangle(length: 3, width: 5)
print("Rectangle Area: \(String(format: "%.4f", newRectangle.calculateArea()))")


let newSphere = Sphere(diameter: 10)
print("Sphere Area: \(String(format: "%.4f", newSphere.calculateArea())) Sphere Volume: \(String(format: "%.4f", newSphere.volume))")

//: [Next](@next)
