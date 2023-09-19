/*
Chris Olsen
Assignment 3, Part 2
*/

import Foundation
//: ### Question A

let nums: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

for num in nums {
  if num.isMultiple(of: 2) {
    print(num)
  }
}

//: ### Question B

let sentence = "The qUIck bRown fOx jumpEd over the lAzy doG"
let vowels: [Character] = ["a","e","i","o","u"]
var totalVowels = 0

for letter in sentence {
  
  if vowels.contains(letter.lowercased()) {
    totalVowels += 1
  }
}

//: ### Question C

let array1 = [0,1,2,3,4]
let array2 = [0,1,2,3,4]

for array1Num in array1 {
  for array2Num in array2 {
    print("\(array1Num) * \(array2Num) = \(array1Num * array2Num)")
  }
}

//: ### Question D

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

let optionalArray: [Int]? = nil

average(numArray: nums)
average(numArray: optionalArray)

//: ### Question E

struct Person {
  var firstName: String
  var lastName: String
  var age: Int
  
  func details(){
    print("Name: \(firstName) \(lastName), Age: \(age)")
  }
}

let person = Person(firstName: "Chris", lastName: "Olsen", age: 35)
person.details()

//: ### Question F

class Student {
  var person: Person
  var grades: [Int]
  
  init(firstName: String, lastName: String, age: Int, grades: [Int]) {
    self.person = Person(firstName: firstName, lastName: lastName, age: age)
    self.grades = grades
  }
  
  func calculateAverageGrade() -> Double {
    var gradeSum: Double = 0
    
    for grade in grades {
      gradeSum += Double(grade)
    }
    let gradeAverage = gradeSum / Double(grades.count)
    
    return gradeAverage
  }
  
  func details() {
    let tempAverageGrade = calculateAverageGrade()
    print("Name: \(person.firstName) \(person.lastName), Age: \(person.age), GPA: \(tempAverageGrade)")
  }
}


let newStudent = Student(firstName: "Chris", lastName: "Olsen", age: 35, grades: [94, 99, 81, 100, 79])
newStudent.details()
