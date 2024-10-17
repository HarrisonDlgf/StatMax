//
//  ContentView.swift
//  NoblesStatsMax
//
//  Created by Harrison on 2/6/23.
//

import SwiftUI

// ADD K, K%, RBI,


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        TabView {
            ViewPlayerView()
                .tabItem {
                    Label("View", systemImage: "eye.fill")
                }
                .environment(\.managedObjectContext, viewContext)
            
            AddPlayerView()
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
                .environment(\.managedObjectContext, viewContext)

            EditPlayerView()
                .tabItem {
                    Label("Edit", systemImage: "pencil")
                }
                .environment(\.managedObjectContext, viewContext)
            LeaderboardView()
                .tabItem {
                    Label("Leaderboard", systemImage: "star.fill")
                }
                .environment(\.managedObjectContext, viewContext)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Formatter {
    static let playerDataFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.zeroSymbol = ""
        return formatter
    }()
}

