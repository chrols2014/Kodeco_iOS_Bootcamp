//
//  Task.swift
//  TaskList
//
//  Created by Chris Olsen on 2023-10-02.
//

import Foundation


class TaskStore: ObservableObject {
  @Published var allTasks: [Task]
  
  init() {
    self.allTasks = MockData().startingValues
  }
  
  func addTask(_ taskTitle: String,_ taskNote: String) {
    allTasks.append(Task(title: taskTitle, isCompleted: false, notes: taskNote))
  }
  
  func completeTask() {
    
  }
  
}


struct Task: Identifiable, Hashable {
  
  let id = UUID()
  var title: String
  var isCompleted: Bool
  var notes: String
  
}


struct MockData {
  
  let startingValues: [Task] =
  [Task(title: "Test1", isCompleted: true, notes: "nope"),
   Task(title: "Test2", isCompleted: true, notes: "nope"),
   Task(title: "Test3", isCompleted: true, notes: "nope"),
   Task(title: "Test4", isCompleted: true, notes: "nope"),
   Task(title: "Test5", isCompleted: true, notes: "nope"),
   Task(title: "Test1", isCompleted: true, notes: "nope"),
    Task(title: "Test2", isCompleted: true, notes: "nope"),
    Task(title: "Test3", isCompleted: true, notes: "nope"),
    Task(title: "Test4", isCompleted: true, notes: "nope"),
    Task(title: "Test5", isCompleted: true, notes: "nope"),
   Task(title: "Test1", isCompleted: true, notes: "nope"),
    Task(title: "Test2", isCompleted: true, notes: "nope"),
    Task(title: "Test3", isCompleted: true, notes: "nope"),
    Task(title: "Test4", isCompleted: true, notes: "nope"),
    Task(title: "Test5", isCompleted: true, notes: "nope")]
  
}
