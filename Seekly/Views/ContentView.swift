//
//  ContentView.swift
//  Seekly
//
//  Created by Mike Merkelbag on 21/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var showingSearchSheet = false
    @FocusState private var isTextFieldFocused: Bool
    @State private var recenterTrigger = false

    var body: some View {
        ZStack(alignment: .bottom) {
            MapView(recenterTrigger: $recenterTrigger)
            
            // Invisible tap area to dismiss keyboard
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    isTextFieldFocused = false
                }
                .allowsHitTesting(isTextFieldFocused)
            
            // Recenter button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        recenterTrigger.toggle()
                    }) {
                        Image(systemName: "location.fill")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.blue)
                            .frame(width: 44, height: 44)
                            .background(
                                Circle()
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                            )
                    }
                }
                .padding(.trailing, 16)
                .padding(.bottom, 92) // Position above search bar
            }
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("What are you looking for?", text: $searchText)
                    .focused($isTextFieldFocused)
                    .onSubmit {
                        showingSearchSheet = true
                        isTextFieldFocused = false
                    }
                
                Button(action: {
                    showingSearchSheet = true
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
        .sheet(isPresented: $showingSearchSheet) {
            SearchSheet(searchQuery: searchText)
        }
    }
}

#Preview {
    ContentView()
}
