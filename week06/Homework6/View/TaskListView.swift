//
//  TaskListView.swift
//  

import SwiftUI

struct TaskListView: View {
  @ObservedObject var taskStore: TaskStore
  @State private var searchTerm = ""
  var isShowingCompleted: Bool
  
  
  var filteredTasks: [Task] {
    
    switch isShowingCompleted {
    case true :
      guard !searchTerm.isEmpty else { return taskStore.tasks.filter { $0.isCompleted } }
      return taskStore.tasks.filter { $0.isCompleted && $0.title.lowercased().contains(searchTerm.lowercased()) }
   
    case false:
      guard !searchTerm.isEmpty else { return taskStore.tasks.filter { !$0.isCompleted } }
      return taskStore.tasks.filter { !$0.isCompleted && $0.title.lowercased().contains(searchTerm.lowercased()) }
    }
    
//    guard !searchTerm.isEmpty else { return isShowingCompleted ?  taskStore.tasks.filter { $0.isCompleted } : taskStore.tasks.filter { !$0.isCompleted } }
//         return taskStore.tasks.filter { task in
//           task.title.lowercased().contains(searchTerm.lowercased())
//         }
     }
  var body: some View {
    
  
    
    
      
//    List(isShowingCompleted ? (taskStore.tasks.filter { !$0.isCompleted && $0.title.lowercased().contains(searchTerm.lowercased()) }) : (taskStore.tasks.filter { $0.isCompleted && $0.title.lowercased().contains(searchTerm.lowercased())})) { task in
      
      List(filteredTasks) { task in
          
         // if task.isCompleted == false {
            NavigationLink(value: task) {
              
              TaskRowView(task: task)
              
              //.padding([.leading, .trailing], 20)
            }
          //}
        }
    .searchable(text: $searchTerm)
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
