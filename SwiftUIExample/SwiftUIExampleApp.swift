//
//  SwiftUIExampleApp.swift
//  SwiftUIExample
//
//  Created by seven mr on 2024/7/30.
//

import SwiftUI

@main
struct SwiftUIExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
