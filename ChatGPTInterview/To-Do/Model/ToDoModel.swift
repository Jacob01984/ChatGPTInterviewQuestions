//
//  ToDoModel.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/5/23.
//

import Foundation

struct Task: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let dateCreated: Date
    var completeBy: Date
    var isCompleted: Bool
}
