//
//  ToDoRootView.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/5/23.
//

import SwiftUI

struct ToDoRootView: View {
    @ObservedObject var taskViewModel = TaskViewModel()
    @State var showSheet = false
    @State var title: String = ""
    @State var completeBy = Date()
    
    var body: some View {
        
        NavigationStack {
            List {
                Section("In Progress") {
                    ForEach(taskViewModel.inProgressTasks, id: \.id) { task in
                        TaskRow(taskViewModel: taskViewModel, task: task)
                    }
                    .onDelete(perform: taskViewModel.deleteTask)
                }
                Section("Completed") {
                    ForEach(taskViewModel.completedTasks, id: \.id) { task in
                        TaskRow(taskViewModel: taskViewModel, task: task)
                    }
                }
            }
    
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        
        .sheet(isPresented: $showSheet) {
            CreateTask(taskViewModel: taskViewModel, title: $title, completeBy: $completeBy)
                .presentationDetents([.fraction(0.30)])
        }
    }
}

struct ToDoRootView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoRootView()
    }
}
