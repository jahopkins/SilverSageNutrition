//
//  Silver_Sage_NutritionApp.swift
//  Silver Sage Nutrition
//
//  Created by Jacqueline Hopkins on 2/13/23.
//

import SwiftUI
import FirebaseCore

@main
struct Silver_Sage_NutritionApp: App {
    @StateObject var model = ViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            let appViewModel = AppViewModel()
            ContentView()
                .environmentObject(appViewModel)
        }
    }
}
