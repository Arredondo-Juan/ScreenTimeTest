//
//  DashboardView.swift
//  ScreenTimeTest
//
//  Created by Juan Arredondo on 3/28/25.
//

import SwiftUI
import DeviceActivity
import FamilyControls
import ManagedSettings

struct DashboardView: View {
    @EnvironmentObject private var navigationState: NavigationState
    @StateObject private var monitoringManager = MonitoringManager.shared
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Dashboard")
                .font(.largeTitle)
                .bold()
            
            if monitoringManager.usageData.isEmpty {
                Text("No usage data available yet")
                    .foregroundColor(.gray)
            } else {
                List(monitoringManager.usageData.keys.sorted(), id: \.self) { app in
                    HStack {
                        Text(app)
                        Spacer()
                        Text(formatDuration(monitoringManager.usageData[app] ?? 0))
                    }
                }
            }
        }
        .padding()
    }
    
    private func formatDuration(_ duration: TimeInterval) -> String {
        let hours = Int(duration) / 3600
        let minutes = Int(duration) / 60 % 60
        return String(format: "%d:%02d", hours, minutes)
    }
}

#Preview {
    DashboardView()
        .environmentObject(NavigationState())
}
