//
//  ProfileView.swift
//  Seekly
//
//  Created by Mike Merkelbag on 23/11/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Profile Picture
                Image("ProfilePicture")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 3)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                    .padding(.top, 40)
                
                // User Info
                VStack(spacing: 8) {
                    Text("Mike Merkelbag")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("@mikemerkelbag")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                // Menu Items
                VStack(spacing: 0) {
                    ProfileMenuItem(icon: "heart.fill", title: "Favorites", color: .red)
                    Divider()
                    ProfileMenuItem(icon: "clock.fill", title: "Recent Searches", color: .blue)
                    Divider()
                    ProfileMenuItem(icon: "gearshape.fill", title: "Settings", color: .gray)
                    Divider()
                    ProfileMenuItem(icon: "info.circle.fill", title: "About", color: .blue)
                }
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                .padding(.horizontal)
                .padding(.top, 8)
                
                Spacer(minLength: 40)
            }
        }
    }
}

struct ProfileMenuItem: View {
    let icon: String
    let title: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 24)
            
            Text(title)
                .font(.body)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    ProfileView()
}

