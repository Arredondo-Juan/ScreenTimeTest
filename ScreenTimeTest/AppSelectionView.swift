//
//  AppSelectionView.swift
//  ScreenTimeTest
//
//  Created by Juan Arredondo on 3/28/25.
//

import SwiftUI
import FamilyControls
import DeviceActivity


struct AppSelectionView: View {
    @ObservedObject var model = AppSelectionModel()
    @State private var isPickerPresented = false
    @State private var navigateToDashboard = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Button("Select Apps to Monitor") {
                    isPickerPresented = true
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .familyActivityPicker(isPresented: $isPickerPresented, selection: $model.activitySelection)

                Button("Start Monitoring") {
                    MonitoringManager.shared.startMonitoring(selection: model.activitySelection)
                    navigateToDashboard = true
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
            }
            .padding()
            .navigationDestination(isPresented: $navigateToDashboard) {
                DashboardView()
            }
        }
    }
}

#Preview {
    AppSelectionView()
        .environmentObject(NavigationState())
}
