//
//  ConnexionSwiftuiApp.swift
//  ConnexionSwiftui
//
//  Created by dikeys on 16/04/2021.
//

import SwiftUI
import Firebase
@main
struct ConnexionSwiftuiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ConnexionView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
final class AppDelegate: NSObject, UIApplicationDelegate
{

      func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
            [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
      }
}
