//
//  NoblesStatsMaxApp.swift
//  NoblesStatsMax
//
//  Created by Harrison on 2/6/23.
//

import SwiftUI

@main
struct NoblesStatsMaxApp: App {
    let persistenceController = PersistenceController.shared
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
        }
    }
}
