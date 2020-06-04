//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Nikhi on 04/06/20.
//  Copyright © 2020 TiltGames. All rights reserved.
//


import Foundation


struct Results: Codable {
    var hits: [Post]
}

struct Post: Codable, Identifiable {
    var id: String {
        return objectID
    }
    var title: String
    var points: Int
    var url: String?
    var objectID: String
}


