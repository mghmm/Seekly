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
    
    var filteredBusinesses: [Business] {
        SampleData.businesses(matching: searchQuery)
    }
    
    var body: some View {
        NavigationView {
            List(filteredBusinesses) { business in
                BusinessRow(business: business)
            }
            .listStyle(.plain)
            .navigationTitle(searchQuery.isEmpty ? "Nearby Places" : searchQuery)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
}

struct BusinessRow: View {
    let business: Business
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(business.name)
                        .font(.headline)
                    
                    Text(business.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", business.rating))
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    
                    Text("(\(business.reviewCount))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(business.distanceString)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Text(business.priceString)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 4) {
                    Circle()
                        .fill(business.isOpen ? Color.green : Color.red)
                        .frame(width: 6, height: 6)
                    Text(business.isOpen ? "Open" : "Closed")
                        .font(.caption)
                        .foregroundColor(business.isOpen ? .green : .red)
                }
            }
            
            Text(business.address)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    SearchSheet(searchQuery: "Coffee shops nearby")
}

