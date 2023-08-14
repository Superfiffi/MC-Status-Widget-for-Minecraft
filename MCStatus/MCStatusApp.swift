//
//  MCStatusApp.swift
//  MCStatus
//
//  Created by Tomer Shemesh on 6/27/23.
//

import SwiftUI
import SwiftData

@main
struct MCStatusApp: App {
    var body: some Scene {
        WindowGroup {
            MainAppContentView()
        }
        .modelContainer(SwiftUIHelper.getModelContainter())
    }
}


