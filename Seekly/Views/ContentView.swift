//
//  ContentView.swift
//  Seekly
//
//  Created by Mike Merkelbag on 21/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""

    var body: some View {
        ZStack(alignment: .bottom) {
            MapView()
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("What are you looking for?", text: $searchText)
                
                Button(action: {
                    // TODO: Implement search action
                }) {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 36, height: 36)
                        .background(
                            LinearGradient(
                                colors: [Color.purple, Color(red: 0.65, green: 0.3, blue: 0.9)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(color: Color.purple.opacity(0.3), radius: 4, x: 0, y: 0)
                }
            }
            .padding(.leading)
            .padding(.trailing, 8)
            .padding(.vertical, 8)
            .background(Color(.systemBackground))
            .clipShape(Capsule())
            .shadow(radius: 4)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
