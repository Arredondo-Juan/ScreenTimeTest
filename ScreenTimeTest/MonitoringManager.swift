//
//  MonitoringManager.swift
//  ScreenTimeTest
//
//  Created by Juan Arredondo on 3/28/25.
//

import Foundation
import DeviceActivity
import FamilyControls
import ManagedSettings

class MonitoringManager: ObservableObject {
    static let shared = MonitoringManager()
    private let center = DeviceActivityCenter()

    @Published var usageData: [String: TimeInterval] = [:]

    private init() {
        setupDeviceActivityMonitoring()
    }

    private func setupDeviceActivityMonitoring() {
        let schedule = DeviceActivitySchedule(
            intervalStart: DateComponents(hour: 0, minute: 0),
            intervalEnd: DateComponents(hour: 23, minute: 59),
            repeats: true
        )

        let activityName = DeviceActivityName("DailyMonitoring")

        do {
            try center.startMonitoring(activityName, during: schedule)
            print("Initial monitoring setup completed.")
        } catch {
            print("Failed to start initial monitoring: \(error.localizedDescription)")
        }
    }

    func startMonitoring(selection: FamilyActivitySelection) {
        let schedule = DeviceActivitySchedule(
            intervalStart: DateComponents(hour: 0, minute: 0),
            intervalEnd: DateComponents(hour: 23, minute: 59),
            repeats: true
        )

        let activityName = DeviceActivityName("DailyMonitoring")

        do {
            try center.startMonitoring(activityName, during: schedule)
            print("Monitoring started successfully.")
        } catch {
            print("Failed to start monitoring: \(error.localizedDescription)")
        }
    }

    func updateUsageData(for app: String, duration: TimeInterval) {
        DispatchQueue.main.async {
            self.usageData[app] = (self.usageData[app] ?? 0) + duration
        }
    }
}
