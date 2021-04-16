//
//  ConnexionSwiftuiApp.swift
//  ConnexionSwiftui
//
//  Created by dikeys on 16/04/2021.
//

import SwiftUI

@main
struct ConnexionSwiftuiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
