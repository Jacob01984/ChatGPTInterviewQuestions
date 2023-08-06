//
//  PostView.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/4/23.
//

import SwiftUI

struct PostView: View {
    var post: PostData
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.title)
                .bold()
            Divider()
            Text(post.body)
                .font(.title3)
            Spacer()
        }
        .padding(.horizontal)
    }
}


