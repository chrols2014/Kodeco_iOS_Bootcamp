//
//  TaskRow.swift
//  

import SwiftUI

struct TaskRowView: View {
 //@ObservedObject var taskStore: TaskStore
  
  @Binding var task: Task
  //@State var completeState

  var body: some View {
    HStack {
      Text(task.title)
      Spacer()
      
    
      
      Button {
  
        task.isCompleted.toggle()
       
      } label: {
        Image(systemName: task.isCompleted ? "checkmark.square" : "square")
        
         
        
        
          //.contentTransition(.symbolEffect(.replace))

          .foregroundColor(task.isCompleted ? Color.green : Color.red)
          
      }
      
      .buttonStyle(BorderlessButtonStyle())
    
      
      //
//      Button(action: { task.isCompleted.toggle() } ,
//             label: {
//        Image(systemName: task.isCompleted ? "checkmark.square" : "square")
//          .foregroundColor(task.isCompleted ? Color.green : Color.red)
//          .contentTransition(.symbolEffect(.replace))
//          //.transition(.scale.animation(.easeInOut))
//          //.animation(.easeIn, value: task.isCompleted)
//      })
//      .buttonStyle(BorderlessButtonStyle())

      
      //
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
