//
//  watchOs_TimerApp.swift
//  watchOs_Timer WatchKit Extension
//
//  Created by 윤주원 on 2022/08/25.
//

import SwiftUI

@main
struct watchOs_TimerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
