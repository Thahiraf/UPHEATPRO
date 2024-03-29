//
//  UpHeatProApp.swift
//  UpHeatPro
//
//  Created by Thahi on 03/11/2021.
//

import SwiftUI
import Firebase
@main
struct UpHeatProApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate{
    
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{

        FirebaseApp.configure()
        return true
    }
}
