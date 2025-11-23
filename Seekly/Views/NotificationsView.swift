//
//  NotificationsView.swift
//  Seekly
//
//  Created by Mike Merkelbag on 23/11/25.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Empty state
                VStack(spacing: 12) {
                    Image(systemName: "bell.badge")
                        .font(.system(size: 36))
                        .foregroundStyle(.gray.opacity(0.4))
                        .padding(.top, 100)
                    
                    Text("No new notifications")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .fontWeight(.medium)
                }
                
                Spacer(minLength: 40)
            }
        }
        .navigationTitle("Activity")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NotificationsView()
}

