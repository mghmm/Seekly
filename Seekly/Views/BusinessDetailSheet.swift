//
//  BusinessDetailSheet.swift
//  Seekly
//
//  Created by Mike Merkelbag on 21/11/25.
//

import SwiftUI

struct BusinessDetailSheet: View {
    let business: Business
    let onDismiss: () -> Void
    
    var body: some View {
        NavigationView {
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
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(business.name)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text(business.category)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 4) {
                                HStack(spacing: 2) {
                                    Image(systemName: "star.fill")
                                        .font(.body)
                                        .foregroundColor(.yellow)
                                    Text(String(format: "%.1f", business.rating))
                                        .font(.body)
                                        .fontWeight(.semibold)
                                }
                                
                                Text("(\(business.reviewCount))")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
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
                            
                            Text(business.priceString)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
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
            .navigationTitle("Business Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: onDismiss) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                            .font(.title3)
                    }
                }
            }
        }
        .presentationDetents([.fraction(0.67)])
        .presentationDragIndicator(.visible)
        .presentationBackgroundInteraction(.enabled)
        .interactiveDismissDisabled(false)
    }
}

#Preview {
    BusinessDetailSheet(business: SampleData.businesses[0]) {
        // Dismiss action
    }
}

