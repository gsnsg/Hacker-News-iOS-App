//
//  SearchBar.swift
//  Hacker News
//
//  Created by Nikhi on 01/09/20.
//  Copyright © 2020 TiltGames. All rights reserved.
//

import Foundation
import SwiftUI


struct SearchBar: UIViewRepresentable {
    
    
    @Binding var searchText: String
    @ObservedObject var networkManager: NetworkManager
    
    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: SearchBar
        
        init(_ parent: SearchBar) {
            self.parent = parent
        }
        
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.searchText = searchText
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            if let tagName = searchBar.text, tagName.count != 0 {
                let safeTag = tagName.trimmingCharacters(in: .whitespacesAndNewlines)
                parent.networkManager.fetchPostsByTag(tagName: safeTag)
            }
            searchBar.resignFirstResponder()
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
            
        }
        

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
        }
        
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.keyboardType = .webSearch
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        
        uiView.text = searchText
    }
}
