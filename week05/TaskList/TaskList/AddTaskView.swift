//
//  AddTaskView.swift
//  TaskList
//
//  Created by Chris Olsen on 2023-10-02.
//

import SwiftUI

struct AddTaskView: View {
  @ObservedObject var taskStore: TaskStore
  @Environment(\.dismiss) var dismiss
  @State private var taskTitle: String = ""
  @State private var taskNote: String = ""
  
    var body: some View {
      NavigationView {
        Form {
          Section("Task Title") {
            TextField("Title",text: $taskTitle)
          }
          Section("Notes") {
            TextField("Notes",text: $taskNote)
          }
        }
        .navigationBarItems(leading: Button("Cancel",
                                            action: { dismiss() }))
        .navigationBarItems(trailing: Button("Add",
                                             action: {
          taskStore.addTask(taskTitle, taskNote)
          dismiss()
        }))
      }
    }
}

#Preview {
    AddTaskView(taskStore: TaskStore())
}
