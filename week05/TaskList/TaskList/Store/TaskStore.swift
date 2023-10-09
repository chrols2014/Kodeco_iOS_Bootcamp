//
//  TaskStore.swift
//  TaskList
//
//  Created by Chris Olsen on 2023-10-02.
//

import Foundation

class TaskStore: ObservableObject {
  @Published var allTasks: [Task]
  
  init() {
    self.allTasks = StartingData().startingValues
  }
  
  func addTask(_ taskTitle: String,_ taskNote: String) {
    allTasks.append(Task(title: taskTitle, isCompleted: false, notes: taskNote))
  }
  
//  func completeTask() {
//    // implemented using binding within the toggle view
//  }
  
  
  
  
}
