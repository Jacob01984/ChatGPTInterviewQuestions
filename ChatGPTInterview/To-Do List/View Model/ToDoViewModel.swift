//
//  ToDoViewModel.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/5/23.
//

import Foundation

class TaskViewModel: ObservableObject, Identifiable {
    
    @Published var inProgressTasks = [Task]()
    @Published var completedTasks = [Task]()
    
    init() {
        // Create some dummy tasks and add them to the tasks array
        let task1 = Task(title: "Buy groceries", dateCreated: Date(), completeBy: Date(), isCompleted: false)
        let task2 = Task(title: "Finish project", dateCreated: Date(), completeBy: Date(), isCompleted: false)
        let task3 = Task(title: "Call mom", dateCreated: Date(), completeBy: Date(), isCompleted: false)
        
        inProgressTasks = [task1, task2, task3]
    }
    
    func createTask(title: String, completeBy: Date) {
        let task = Task(title: title, dateCreated: Date(), completeBy: completeBy, isCompleted: false)
        inProgressTasks.append(task)
    }
    func deleteTask(at offsets: IndexSet) {
        inProgressTasks.remove(atOffsets: offsets)
    }
    func markTaskAsCompleted(task: Task) {
        guard let index = inProgressTasks.firstIndex(of: task) else { return }
        inProgressTasks.remove(at: index)
        completedTasks.append(task)
    }
    func markTaskAsInProgress(task: Task) {
        guard let index = completedTasks.firstIndex(of: task) else { return }
        completedTasks.remove(at: index)
        inProgressTasks.append(task)
    }
    func isTaskCompleted(_ task: Task) -> Bool {
        return completedTasks.contains(task)
    }
}
