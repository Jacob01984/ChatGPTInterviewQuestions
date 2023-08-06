//
//  TaskRow.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/6/23.
//

import SwiftUI

struct TaskRow: View {
    @ObservedObject var taskViewModel: TaskViewModel
    var task: Task
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(task.title)
                    .font(.title)
                Spacer()
                Button {
                    if task.isCompleted {
                        taskViewModel.markTaskAsInProgress(task: task)
                    } else {
                        taskViewModel.markTaskAsCompleted(task: task)
                    }
                } label: {
                    Image(systemName: taskViewModel.isTaskCompleted(task) ? "checkmark.square" : "square")
                        .font(.title2)
                        .foregroundColor(taskViewModel.isTaskCompleted(task) ? .green : .primary)
                }
                
            }
            Text("Deadline: \(task.completeBy.formatted())")
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(taskViewModel: TaskViewModel(), task: Task(title: "Hello world", dateCreated: Date(), completeBy: Date(), isCompleted: false))
    }
}
