//
//  SearchSheet.swift
//  Seekly
//
//  Created by Mike Merkelbag on 21/11/25.
//

import SwiftUI

struct SearchSheet: View {
    let searchQuery: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
            }
            .navigationTitle(searchQuery.isEmpty ? "No query" : searchQuery)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
        .presentationDetents([.medium])
    }
}

#Preview {
    SearchSheet(searchQuery: "Coffee shops nearby")
}

