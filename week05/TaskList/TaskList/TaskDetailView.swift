//
//  TaskDetailView.swift
//  TaskList
//
//  Created by Chris Olsen on 2023-10-02.
//

import SwiftUI

struct TaskDetailView: View {
  @ObservedObject var taskStore: TaskStore
 // @Binding var taskCoompleted: Bool
  
  //let task: Task
  
    var body: some View {
      Form {
        Section("Task Title") {
          //TextField("Title",text: task.title)
        }
        Section("Notes") {
          //TextField("Notes",text: $taskStore.allTasks[0].title)
        }
//        Section("Completed") {
//          Toggle(isOn: $taskCoompleted, label: {
//            Text("Completed")
//          })
//        }
      }
    }
}

#Preview {
  TaskDetailView(taskStore: TaskStore())
}
