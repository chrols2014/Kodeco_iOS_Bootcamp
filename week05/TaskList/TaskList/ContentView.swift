//
//  ContentView.swift
//  TaskList
//
//  Created by Chris Olsen on 2023-10-02.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var taskStore: TaskStore
  @State private var showingAddTaskSheet = false
  
  var body: some View {

    NavigationStack {
      ForEach(taskStore.allTasks, id: \.id) { task in
        NavigationLink(value: task) {
          TaskRowView(task: task)
        }
      }
      Spacer()
      
      Button(action: {
        showingAddTaskSheet.toggle()
      }, label: {
        HStack {
          Image(systemName: "plus.circle.fill")
          Text("Add Task")
        }
      })
      
      
      .navigationBarTitle("Task List")
      .navigationDestination(for: Task.self) { task in
        TaskDetailView(taskStore: taskStore)
      }
      
      
      .sheet(isPresented: $showingAddTaskSheet) {
        AddTaskView(taskStore: taskStore)
      }
    }
      

    
  }
}

#Preview {
  ContentView(taskStore: TaskStore())
}
