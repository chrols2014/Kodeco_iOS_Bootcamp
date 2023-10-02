//
//  TaskListApp.swift
//  TaskList
//
//  Created by Chris Olsen on 2023-10-02.
//

import SwiftUI

@main
struct TaskListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(taskStore: TaskStore())
        }
    }
}
