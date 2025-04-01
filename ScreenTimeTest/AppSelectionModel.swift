//
//  AppSelectionModel.swift
//  ScreenTimeTest
//
//  Created by Juan Arredondo on 3/28/25.
//

import Foundation
import SwiftUI
import FamilyControls
import ManagedSettings

class AppSelectionModel: ObservableObject {
    @AppStorage("savedSelection") private var savedSelectionData: Data?
    
    @Published var activitySelection = FamilyActivitySelection() {
        didSet {
            saveSelection()
        }
    }
    
    let store = ManagedSettingsStore()

    init() {
        loadSelection()
    }

    private func saveSelection() {
        if let encoded = try? JSONEncoder().encode(activitySelection) {
            savedSelectionData = encoded
        }
    }

    private func loadSelection() {
        if let savedData = savedSelectionData,
           let decoded = try? JSONDecoder().decode(FamilyActivitySelection.self, from: savedData) {
            activitySelection = decoded
        }
    }

    func applySelection() {
        store.shield.applications = activitySelection.applicationTokens
    }
}
