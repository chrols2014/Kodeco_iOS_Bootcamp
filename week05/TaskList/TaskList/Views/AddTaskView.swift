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
          TextField("Notes",text: $taskNote, axis: .vertical)
            .lineLimit(5...)
        }
      }
      .navigationBarItems(leading: Button("Cancel",
                                          action: { dismiss() }))
      .navigationBarItems(trailing:
                            Button("Add",
                                   action: {
        taskStore.addTask(taskTitle, taskNote)
        dismiss()
      }).disabled(taskTitle != "" ? false : true))
      
      .navigationTitle("Adding a New Task")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  AddTaskView(taskStore: TaskStore())
}
