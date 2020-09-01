//
//  DetailView.swift
//  Hacker News
//
//  Created by Nikhi on 04/06/20.
//  Copyright © 2020 TiltGames. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url).edgesIgnoringSafeArea(.all)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.apple.com")
    }
}
