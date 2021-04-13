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
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(stories, id: \.author.nickname, content: { story in
                            VStack {
                                ZStack {
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple, Color.orange]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                                        .frame(width: 65, height: 65)
                                    
                                    Image(uiImage: story.author.image)
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width: 60, height: 60)
                                        .clipped()
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                }
                                Text(story.author.nickname)
                                    .font(.caption)
                            }
                        })
                    }
                    .padding([.top, .bottom], 10)
                }
                
                Divider()
                
                List(feed, id: \.author.nickname, rowContent: { post in
                    VStack (alignment: .leading) {
                        HStack {
                            Image(uiImage: post.author.image)
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 30, height: 30)
                                .clipped()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
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
                })
            }
            .navigationBarTitle("Instagram", displayMode: .inline)
            .navigationBarItems(leading: Image(systemName: "camera"), trailing: Image(systemName: "paperplane"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(feed: Post.mocks(), stories: Story.mocks())
    }
}
