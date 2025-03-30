//
//  AppSelectionModel.swift
//  ScreenTimeTest
//
//  Created by Juan Arredondo on 3/28/25.
//

import Foundation
import SwiftUI
import FamilyControls

class AppSelectionModel: ObservableObject {
    @Published var activitySelection = FamilyActivitySelection()
}
