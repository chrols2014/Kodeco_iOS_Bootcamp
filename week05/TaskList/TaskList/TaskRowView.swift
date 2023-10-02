//
//  TaskRowView.swift
//  TaskList
//
//  Created by Chris Olsen on 2023-10-02.
//

import SwiftUI

struct TaskRowView: View {
  let task: Task
  
    var body: some View {
      HStack {
        Text(task.title)
        Spacer()
        Image(systemName: task.isCompleted ? "checkmark.square" : "square")
          .foregroundColor(task.isCompleted ? .green : .red)
      }
      .padding()
      .font(.title2)
    }
}

#Preview {
  TaskRowView(task: Task(title: "Test", isCompleted: false, notes: "Some notes go here"))
}
