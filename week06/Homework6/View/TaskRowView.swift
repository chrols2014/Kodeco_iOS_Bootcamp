//
//  TaskRow.swift
//

import SwiftUI

struct TaskRowView: View {
  @State private var animate = false
  @Binding var task: Task
  
  var body: some View {
    HStack {
      Text(task.title)
      Spacer()
      Button {
        animate.toggle()
        task.isCompleted.toggle()
      } label: {
        Image(systemName: task.isCompleted ? "checkmark.square" : "square")
          .symbolEffect(.bounce, value: animate)
          .contentTransition(.symbolEffect(.replace))
          .foregroundColor(task.isCompleted ? Color.green : Color.red)
      }
      
      .buttonStyle(BorderlessButtonStyle())
    }
    .font(.title3)
    .bold()
    .padding([.top, .bottom], 15)
    .padding([.leading, .trailing], 10)
  }
}

struct TaskRow_Previews: PreviewProvider {
  @State static var task = Task(title: "This Task", category: .noCategory, isCompleted: true)
  static var previews: some View {
    TaskRowView(task: $task)
  }
}
