//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Nikhi on 04/06/20.
//  Copyright © 2020 TiltGames. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    
    func fetchPosts(currentURL: String) {
        if let url = URL(string: currentURL) {
            fetch(urlString: url)
        }
    }
    
    func fetchPostsByTag(tagName: String) {
        let urlString = "https://hn.algolia.com/api/v1/search?query=\(tagName)&tags=story"
        if let url = URL(string: urlString) {
            fetch(urlString: url)
        }
    }
    
    
    func fetch(urlString: URL) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlString) { (data, response, error) in
            if error == nil {
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let postsData = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = postsData.hits
                        }
                        
                    } catch {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
    
}
