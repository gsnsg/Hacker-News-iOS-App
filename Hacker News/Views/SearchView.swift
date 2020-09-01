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
    @State private var showingDetail = false
    @State private var selectedPost: Post?
    
    var body: some View {
        
        NavigationView {
            VStack {
                SearchBar(searchText: $input, networkManager: networkManager)
                List(networkManager.posts) {post in
                    HStack {
                        VStack {
                            Image(systemName: "arrowtriangle.up.square.fill")
                            Text("\(post.points)")
                        }
                        Text(post.title)
                    }.onTapGesture {
                        self.showingDetail.toggle()
                        self.selectedPost = post
                    }
                }
            }.navigationBarTitle("Search")
                .sheet(isPresented: $showingDetail) {
                    WebView(urlString: self.selectedPost!.url)
            }
        }
    }
    
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
