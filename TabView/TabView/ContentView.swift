//
//  ContentView.swift
//  TabView
//
//  Created by Alumno on 13/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchReq : String = ""
    var body: some View {
        TextField(
            "Search inside tab", text: $searchReq)
        TabView {
            RickAndMorty(searchReq: searchReq)
                .tabItem {
                    Label("R&M", systemImage: "list.dash")
                }
            FotosView(searchReq: searchReq)
                .tabItem {
                    Label("NASA", systemImage: "list.dash")
                }
            
        }
    }
}

#Preview {
    ContentView()
}
