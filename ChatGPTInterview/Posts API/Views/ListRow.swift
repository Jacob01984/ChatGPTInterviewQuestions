//
//  ListRow.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/4/23.
//

import SwiftUI

struct ListRow: View {
    var post: PostData
    
    var body: some View {
        
        HStack {
            Text(post.title)
                .font(.title3)
            Spacer()
        }
        .padding(.horizontal)
        
    }
}

//struct ListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRow()
//
//    }
//}
