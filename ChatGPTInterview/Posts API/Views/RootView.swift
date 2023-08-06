//
//  ContentView.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/4/23.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var contentModel = ContentModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(contentModel.posts, id: \.id) { post in
                    NavigationLink {
                        PostView(post: post)
                    } label: {
                        ListRow(post: post)
                    }
                }
                .navigationTitle("Posts")
            }
        }
        
        .onAppear(perform: contentModel.getPosts)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
