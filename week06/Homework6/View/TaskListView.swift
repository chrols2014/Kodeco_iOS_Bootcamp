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
    
  }
  var body: some View {
    
    // To see functioanality of animation, change "filteredTasks" to "taskStore.tasks"
    List(filteredTasks) { task in
      NavigationLink(value: task) {
        TaskRowView(task: $taskStore.tasks
          .first(where: { $0.id == task.id })!)
      }
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
