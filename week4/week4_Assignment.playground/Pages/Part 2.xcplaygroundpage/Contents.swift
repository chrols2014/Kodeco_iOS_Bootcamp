//: [Previous](@previous)

/*
Chris Olsen
Assignment 4, Part 2
*/

import Foundation

//: ### Question A

let numss: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]  //renamed because we declare a new "nums" later

func average(numArray: [Int]?) {
  
  var arraySum = 0
  
  if let numArray = numArray {
    for num in numArray {
      arraySum += num
    }
    
    let average = arraySum / numArray.count
    print("The average of the values in the array is \(average).")
  } else {
    print("The array is nil. Calculating the average is impossible.")
  }
}

func average(forArray numArray: [Int]?) {
  
  var arraySum = 0
  
  if let numArray = numArray {
    for num in numArray {
      arraySum += num
    }
    
    let average = arraySum / numArray.count
    print("The average of the values in the array is \(average).")
  } else {
    print("The array is nil. Calculating the average is impossible.")
  }
}

func average(_ numArray: [Int]?) {
  var arraySum = 0
  
  if let numArray = numArray {
    for num in numArray {
      arraySum += num
    }
    
    let average = arraySum / numArray.count
    print("The average of the values in the array is \(average).")
  } else {
    print("The array is nil. Calculating the average is impossible.")
  }
}

average(forArray: numss)
average(numArray: numss)
average(numss)

//: ### Question B

enum Animal {
  case dog, pig, cow, cat, chicken, sheep
}

func theSoundMadeBy(for animal: Animal) -> String {
  switch animal {
  case .dog:
    return("A dog goes woof.")
  case .pig:
    return("A dog goes oink.")
  case .cow:
    return("A dog goes mooo.")
  case .cat:
    return("A dog goes meow.")
  case .chicken:
    return("A chicken goes buckahhh.")
  case .sheep:
    return("A sheep goes baaah.")
  }
}

print(theSoundMadeBy(for: .chicken))
print(theSoundMadeBy(for: .cow))


//: ### Question C

let nums: [Int] = Array(0...100)
let numsWithNil: [Int?] = [79, nil, 80, nil, 90, nil, 100, 72]


let numsBy2: [Int] = Array(stride(from: 2, through: 100, by: 2)) //check
let numsBy4: [Int] = Array(stride(from: 2, through: 100, by: 4)) //check


func evenNumbersArray(originalArray: [Int]) -> [Int] {
  let evenNumbers: [Int] = originalArray.filter { num in
    num % 2 == 0
  }
  return evenNumbers
  }

print(evenNumbersArray(originalArray: nums))


func sumOfArray(originalArray: [Int?]) -> Int {
  let arraySum = originalArray.compactMap { $0 }.reduce(0) { (total, nextValue) -> Int in
    total + nextValue
  }
  return arraySum
}

print(sumOfArray(originalArray: numsWithNil))
  
func commonElementsSet(array1: [Int], array2: [Int]) -> Set<Int> {
  
  let sharedElements = Set(array1.filter(array2.contains))
  
  return sharedElements
}

print(commonElementsSet(array1: numsBy2, array2: numsBy4))

//: ### Question D

struct Square {
  var sideLength: Int
  var area: Int {
    return sideLength * sideLength
  }
}

let newSquare = Square(sideLength: 3)
print("\(newSquare.area)")



//: [Next: Part 3 - Above and Beyond Solution](@next)
