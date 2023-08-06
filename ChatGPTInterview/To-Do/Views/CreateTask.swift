//
//  CreateTask.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/6/23.
//

import SwiftUI

struct CreateTask: View {
    
    @ObservedObject var taskViewModel: TaskViewModel
    
    @State var showSheet = false
    
    @Binding var title: String
    @Binding var completeBy: Date
    
    var body: some View {
        
        Form {
            HStack {
                Text("Title:")
                TextField("Title", text: $title)
            }
            DatePicker("Complete by:", selection: $completeBy)
            HStack {
                Spacer()
                Button {
                    taskViewModel.createTask(title: title, completeBy: completeBy)
                    showSheet = false
                } label: {
                    Text("Done")
                }
                Spacer()
            }
            
        }
        
    }
}

struct CreateTask_Previews: PreviewProvider {
    static var previews: some View {
        CreateTask(taskViewModel: TaskViewModel(), title: .constant("Go to the gym"), completeBy: .constant(Date()))
    }
}
