//
//  SearchSheet.swift
//  Seekly
//
//  Created by Mike Merkelbag on 21/11/25.
//

import SwiftUI
import MapKit

struct SearchSheet: View {
    @StateObject private var viewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    @State private var selectedDetent: PresentationDetent = .medium
    
    init(searchQuery: String) {
        self._viewModel = StateObject(wrappedValue: SearchViewModel(initialQuery: searchQuery))
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.searchResults) { result in
                NavigationLink(destination: SearchResultDetailView(result: result, selectedDetent: $selectedDetent)) {
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
            .onAppear {
                selectedDetent = .medium
            }
        }
        .presentationDetents([.medium, .fraction(0.67), .large], selection: $selectedDetent)
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

// MARK: - Search Result Detail View
struct SearchResultDetailView: View {
    let result: SearchResult
    @Binding var selectedDetent: PresentationDetent
    @State private var isLiked: Bool = false
    
    var business: Business {
        result.business
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Main business info
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .top, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(business.name)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(business.category)
                                .font(.body)
                                .foregroundColor(.secondary)
                            
                            // Details row
                            Spacer()
                            
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
                        }
                        
                        Spacer()
                        
                        // Business Image
                        if let imageUrl = business.imageUrl, let url = URL(string: imageUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 120)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            } placeholder: {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 120, height: 120)
                                    .overlay(
                                        Text(business.emoji)
                                            .font(.system(size: 48))
                                    )
                            }
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 120, height: 120)
                                .overlay(
                                    Text(business.emoji)
                                        .font(.system(size: 48))
                                )
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 4)
                    
                    // Description section
                    if let description = business.description {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("About")
                                .font(.headline)
                            
                            Text(description)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        
                        Divider()
                            .padding(.vertical, 4)
                    }
                    
                    // Address
                    HStack(alignment: .center, spacing: 12) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Address")
                                .font(.headline)
                            
                            Text(business.address)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Open directions in Maps
                            let coordinate = business.coordinate.clCoordinate
                            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
                            mapItem.name = business.name
                            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
                        }) {
                            Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    // Contact section
                    if business.phoneNumber != nil {
                        Divider()
                            .padding(.vertical, 4)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Phone Number")
                                .font(.headline)
                            
                            if let phoneNumber = business.phoneNumber {
                                Link(destination: URL(string: "tel:\(phoneNumber.replacingOccurrences(of: " ", with: ""))")!) {
                                    Text(phoneNumber)
                                        .font(.body)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 4)
                    
                    // Confidence explanation
                    GroupBox {
                        VStack(alignment: .leading, spacing: 8) {
                            Label {
                                Text(result.confidence == "surely" ? "has almond croissants" : "might have almond croissants")
                                    .font(.body)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                            } icon: {
                                Image(systemName: result.confidence == "surely" ? "checkmark.circle.fill" : "questionmark.circle.fill")
                                    .foregroundColor(result.confidence == "surely" ? .green : .orange)
                            }
                            
                            Text("Market Lane Coffee's website says that they sell almond croissants in all their locations. They could run out though, so be sure to give a call.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 4)
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isLiked.toggle()
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .primary)
                }
            }
        }
        .onAppear {
            selectedDetent = .fraction(0.67)
        }
    }
}

#Preview {
    SearchSheet(searchQuery: "Coffee shops nearby")
}

