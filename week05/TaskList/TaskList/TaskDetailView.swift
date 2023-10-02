//
//  TaskDetailView.swift
//  TaskList
//
//  Created by Chris Olsen on 2023-10-02.
//

import SwiftUI

struct TaskDetailView: View {
  @Binding var task: Task
  
  var body: some View {
    Form {
      Section("Task Title") {
        TextField("Title",text: $task.title)
      }
      Section("Notes") {
        TextField("Notes",text: $task.notes, axis: .vertical)
          .lineLimit(5...)
      }
      Section("Completed") {
        Toggle(isOn: $task.isCompleted, label: {
          Text("Completed")
        })
      }
    }
  }
}


#Preview {
  TaskDetailView(task: .constant(Task(title: "test", isCompleted: false, notes: "none")))
}

