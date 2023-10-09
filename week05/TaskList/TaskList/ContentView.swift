//
//  ContentView.swift
//  TaskList
//  Assignment 5 Part 2 & 3
//  Created by Chris Olsen on 2023-10-02.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var taskStore: TaskStore
  @State private var showingAddTaskSheet = false
  
  var body: some View {
    
    NavigationStack {
      ScrollView {
        ForEach($taskStore.allTasks) { $task in
          NavigationLink(destination: TaskDetailView(task: $task)) {
            TaskRowView(task: task)
          }
        }
        Spacer()
        
          .navigationBarTitle("My Tasks")
          .sheet(isPresented: $showingAddTaskSheet) {
            AddTaskView(taskStore: taskStore)
          }
      }
      
      HStack(spacing: 0) {
        Button(action: {
          showingAddTaskSheet.toggle()
        }, label: {
          HStack {
            Image(systemName: "plus.circle.fill")
            Text("Add Task")
          }
        })
        .padding(.top)
        .padding(.leading)
        
        Spacer()
      }
    }
  }
}

#Preview {
  ContentView(taskStore: TaskStore())
}
