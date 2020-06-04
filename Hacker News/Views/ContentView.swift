//
//  ContentView.swift
//  Hacker News
//
//  Created by Nikhi on 04/06/20.
//  Copyright © 2020 TiltGames. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
//    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        TabView {
            FrontPageView().tabItem {
                VStack {
                    Image(systemName: "globe").foregroundColor(.green)
                    Text("Home").fontWeight(.heavy)
                }
            }
            
           
            
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Search Stories")
                    }
            }
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

