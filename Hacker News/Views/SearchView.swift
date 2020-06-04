//
//  SearchView.swift
//  Hacker News
//
//  Created by Nikhi on 04/06/20.
//  Copyright © 2020 TiltGames. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var input: String = ""
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    
    var body: some View {
        
        VStack {
            HStack{
                TextField("Enter search tag", text: $input, onEditingChanged: { (changed) in
                    
                }){
                    self.fetchData()
                }
                    .frame(height: 50)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                    .keyboardType(.webSearch)

                Button(action: {
                    self.fetchData()
                    
                }) {
                    Image(systemName: "magnifyingglass").frame(width: 50, height: 50).foregroundColor(Color("SearchColor"))
                }
            }
            .padding()
            
            
            NavigationView {
                List(networkManager.posts) {post in
                    HStack {
                        NavigationLink(destination: DetailView(url: post.url)) {
                            VStack {
                                Image(systemName: "arrowtriangle.up.square.fill")
                                Text("\(post.points)")
                            }
                            Text(post.title)
                        }
                        
                    }
                }.navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
    
    fileprivate func fetchData() {
        if self.input.count != 0 {
            let tagName = self.input.trimmingCharacters(in: .whitespacesAndNewlines)
            print(tagName)
            self.networkManager.fetchPostsByTag(tagName: tagName)
        }
        self.input = ""
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
