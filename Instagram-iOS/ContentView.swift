//
//  ContentView.swift
//  Instagram-iOS
//
//  Created by Mattia Fasoli on 12/04/21.
//

import SwiftUI

struct ContentView: View {
    
    init(feed: [Post], stories: [Story]) {
        self.feed = feed
        self.stories = stories
    }
    
    let feed: [Post]
    let stories: [Story]
    
    var body: some View {
        NavigationView {
            VStack {
                
                storiesView()
                
                Divider()
                
                feedView()
                
            }
            .navigationBarTitle("Instagram", displayMode: .inline)
            .navigationBarItems(leading: Image(systemName: "camera"), trailing: Image(systemName: "paperplane"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func storiesView() -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(stories, id: \.author.nickname, content: { story in
                    VStack {
                        ZStack {
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple, Color.orange]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                                .frame(width: 65, height: 65)
                            
                            CircleImageView(uiImage: story.author.image, size: 60)
                        }
                        Text(story.author.nickname)
                            .font(.caption)
                    }
                })
            }
            .padding([.top, .bottom], 10)
        }
    }
    
    private func feedView() -> some View {
        List(feed, id: \.author.nickname, rowContent: { post in
            PostView(post: post)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(feed: Post.mocks(), stories: Story.mocks())
    }
}
