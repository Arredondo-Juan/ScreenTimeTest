//
//  ContentView.swift
//  ScreenTimeTest
//
//  Created by Juan Arredondo on 3/28/25.
//

import SwiftUI
import FamilyControls

struct AuthorizationView: View {
    let authorizationCenter = AuthorizationCenter.shared
    @EnvironmentObject private var navigationState: NavigationState

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lock.shield")
                .font(.system(size: 60))
                .foregroundColor(.blue)

            Text("Monitor App Usage")
                .font(.title)
                .bold()

            Text("This app needs your permission to monitor device activity and app usage.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button("Grant Permission") {
                Task {
                    do {
                        try await authorizationCenter.requestAuthorization(for: .individual)
                        navigationState.currentView = .selection
                    } catch {
                        print("Authorization failed: \(error.localizedDescription)")
                    }
                }
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    AuthorizationView()
        .environmentObject(NavigationState())
}
