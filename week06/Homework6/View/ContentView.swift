//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
  @StateObject var taskStore = TaskStore()

  
  var body: some View {
    
    TabView {
      NavigationStack {
        VStack {
          if taskStore.tasks.isEmpty {
            Text("No tasks found")
          } else {
            TaskListView(taskStore: taskStore, isShowingCompleted: false)
          }
          Spacer()
          //NewTaskButton(addingTask: $addingTask)
        }
        //.searchable(text: $searchTerm)
        .navigationTitle("My Tasks")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            NewTaskButtonView(taskStore: taskStore)
          }
        }
      }
      .tabItem {
        Label("Tasks", systemImage: "list.bullet.circle")
      }
      
      NavigationStack {
        VStack {
          if taskStore.tasks.isEmpty {
            Text("No tasks found")
          } else {
            TaskListView(taskStore: taskStore, isShowingCompleted: true)
          }
          Spacer()
          //NewTaskButton(addingTask: $addingTask)
        }
        .navigationTitle("Completed Tasks")
       
      }
      .tabItem {
        Label("Completed", systemImage: "checkmark.circle")
      }
      
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
