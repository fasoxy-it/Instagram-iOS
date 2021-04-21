//
//  PostView.swift
//  Instagram-iOS
//
//  Created by Mattia Fasoli on 21/04/21.
//

import SwiftUI

struct PostView: View {
    
    let post: Post
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                
                CircleImageView(uiImage: post.author.image, size: 30)
                
                VStack (alignment: .leading) {
                    Text(post.author.nickname)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.footnote)
                    Text("Italy")
                        .font(.caption)
                }
            }
            
            Image(uiImage: post.image)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(height: 220)
                .clipped()
                .padding([.leading, .trailing], -20)
            
            HStack {
                Group {
                    Image(systemName: "heart")
                    Image(systemName: "bubble.right")
                    Image(systemName: "paperplane")
                }
                .padding(.trailing, 5)
                Spacer()
                Image(systemName: "bookmark")
            }
            .font(.callout)
            .padding([.top, .bottom], 6)
            
            Group {
                Text(post.author.nickname).fontWeight(.bold) + Text(" ") + Text(post.description)
            }
            .font(.caption)
            .lineLimit(2)
            
        }
        .padding(.bottom, 10)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post.mocks()[0])
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
