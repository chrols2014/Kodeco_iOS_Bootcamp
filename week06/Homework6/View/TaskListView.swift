//
//  TaskListView.swift
//  

import SwiftUI

struct TaskListView: View {
  @ObservedObject var taskStore: TaskStore
  var isShowingCompleted: Bool
  
  var body: some View {
    
      
    List(isShowingCompleted ? (taskStore.tasks.filter { !$0.isCompleted }) : (taskStore.tasks.filter { $0.isCompleted })) { task in
          
         // if task.isCompleted == false {
            NavigationLink(value: task) {
              
              TaskRowView(task: task)
              
              //.padding([.leading, .trailing], 20)
            }
          //}
        }
        .listStyle(.plain)
        .navigationDestination(for: Task.self) { task in
          TaskDetailView(task: $taskStore.tasks
            .first(where: { $0.id == task.id })!)
        }
      
    
  }
}

struct TaskListView_Previews: PreviewProvider {
  static var previews: some View {
    TaskListView(taskStore: TaskStore(), isShowingCompleted: false)
  }
}
