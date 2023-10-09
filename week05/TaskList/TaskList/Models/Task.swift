//
//  Task.swift
//  TaskList
//
//  Created by Chris Olsen on 2023-10-02.
//

import Foundation

struct Task: Identifiable, Hashable {
  
  let id = UUID()
  var title: String
  var isCompleted: Bool
  var notes: String
  
}


struct StartingData {
  
  let startingValues: [Task] =
  [Task(title: "Do grocery shopping", isCompleted: true, notes: """
1) Apples 🍎
2) Patatoes 🥔
3) Beef 🥩
4) Soda 🥤
5) Cleaning Supplies 🧽
"""),
   Task(title: "Finish homework", isCompleted: true, notes: ""),
   Task(title: "Clean out the car", isCompleted: false, notes: ""),
   Task(title: "Call the bank", isCompleted: false, notes: ""),
   Task(title: "Submit the assignment", isCompleted: false, notes: "")]
}
