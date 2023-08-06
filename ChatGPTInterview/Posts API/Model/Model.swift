//
//  Model.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/4/23.
//

import Foundation

struct PostData: Codable, Identifiable, Hashable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
