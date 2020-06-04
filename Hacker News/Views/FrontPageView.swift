//
//  FrontPageView.swift
//  Hacker News
//
//  Created by Nikhi on 04/06/20.
//  Copyright © 2020 TiltGames. All rights reserved.
//

import SwiftUI

struct FrontPageView: View {
    
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
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
                    
                }.navigationBarTitle("HACKER NEWS")
            }
        }.onAppear() {
            self.networkManager.fetchPosts(currentURL: Constants.frontPageURL)
        }
    }
}

struct FrontPageView_Previews: PreviewProvider {
    static var previews: some View {
        FrontPageView()
    }
}
