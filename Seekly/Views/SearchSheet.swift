//
//  SearchSheet.swift
//  Seekly
//
//  Created by Mike Merkelbag on 21/11/25.
//

import SwiftUI

struct SearchSheet: View {
    @StateObject private var viewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    
    init(searchQuery: String) {
        self._viewModel = StateObject(wrappedValue: SearchViewModel(initialQuery: searchQuery))
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.searchResults) { result in
                NavigationLink(destination: BusinessDetailView(business: result.business)) {
                    BusinessRow(result: result)
                }
            }
            .listStyle(.plain)
            .navigationTitle(viewModel.searchQuery.isEmpty ? "Nearby Places" : viewModel.searchQuery)
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
        .presentationBackground(.white)
    }
}

struct BusinessRow: View {
    let result: SearchResult
    
    var business: Business {
        result.business
    }
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 6) {
                            Text(business.name)
                                .font(.headline)
                            
                            Text(result.confidence)
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(
                                    result.confidence == "surely" 
                                        ? Color.green.opacity(0.2) 
                                        : Color.orange.opacity(0.2)
                                )
                                .foregroundColor(
                                    result.confidence == "surely" 
                                        ? Color.green 
                                        : Color.orange
                                )
                                .cornerRadius(8)
                        }
                        
                        Text(business.category)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
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
            
            // Business Image
            if let imageUrl = business.imageUrl, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 72, height: 72)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                } placeholder: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 72, height: 72)
                        .overlay(
                            Text(business.emoji)
                                .font(.title2)
                        )
                }
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 60, height: 60)
                    .overlay(
                        Text(business.emoji)
                            .font(.title2)
                    )
            }
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Business Detail View
struct BusinessDetailView: View {
    let business: Business
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Business emoji header
                HStack {
                    Spacer()
                    Text(business.emoji)
                        .font(.system(size: 60))
                    Spacer()
                }
                .padding(.vertical)
                
                // Main business info
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(business.name)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(business.category)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                        .padding(.vertical, 4)
                    
                    // Details row
                    HStack(spacing: 16) {
                        HStack(spacing: 4) {
                            Image(systemName: "mappin.and.ellipse")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(business.distanceString)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        HStack(spacing: 4) {
                            Circle()
                                .fill(business.isOpen ? Color.green : Color.red)
                                .frame(width: 8, height: 8)
                            Text(business.isOpen ? "Open" : "Closed")
                                .font(.subheadline)
                                .foregroundColor(business.isOpen ? .green : .red)
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 4)
                    
                    // Address
                    VStack(alignment: .leading, spacing: 8) {
                        Label {
                            Text("Address")
                                .font(.headline)
                        } icon: {
                            Image(systemName: "location.fill")
                                .foregroundColor(.blue)
                        }
                        
                        Text(business.address)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    // Phone number if available
                    if let phoneNumber = business.phoneNumber {
                        Divider()
                            .padding(.vertical, 4)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Label {
                                Text("Phone")
                                    .font(.headline)
                            } icon: {
                                Image(systemName: "phone.fill")
                                    .foregroundColor(.blue)
                            }
                            
                            Text(phoneNumber)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SearchSheet(searchQuery: "Coffee shops nearby")
}

