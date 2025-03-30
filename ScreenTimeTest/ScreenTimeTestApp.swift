//
//  ScreenTimeTestApp.swift
//  ScreenTimeTest
//
//  Created by Juan Arredondo on 3/28/25.
//

import SwiftUI
import FamilyControls

@main
struct ScreenTimeTestApp: App {
    @StateObject private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Group {
                    switch navigationState.currentView {
                    case .authorization:
                        AuthorizationView()
                            .environmentObject(navigationState)
                    case .selection:
                        AppSelectionView()
                            .environmentObject(navigationState)
                    case .dashboard:
                        DashboardView()
                            .environmentObject(navigationState)
                    }
                }
            }
        }
    }
}

class NavigationState: ObservableObject {
    enum ViewState {
        case authorization
        case selection
        case dashboard
    }
    
    @Published var currentView: ViewState = .authorization
}
