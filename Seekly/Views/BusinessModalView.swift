//
//  BusinessModalView.swift
//  Seekly
//
//  Created by Mike Merkelbag on 21/11/25.
//

import SwiftUI
import MapKit

struct BusinessModalView: View {
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
                        HStack(alignment: .center, spacing: 12) {
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
                        if business.phoneNumber != nil || business.website != nil || business.email != nil {
                            Divider()
                                .padding(.vertical, 4)
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Label {
                                    Text("Contact")
                                        .font(.headline)
                                } icon: {
                                    Image(systemName: "person.fill")
                                        .foregroundColor(.blue)
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    if let phoneNumber = business.phoneNumber {
                                        HStack(spacing: 8) {
                                            Image(systemName: "phone.fill")
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                                .frame(width: 20)
                                            Text(phoneNumber)
                                                .font(.body)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    
                                    if let website = business.website {
                                        HStack(spacing: 8) {
                                            Image(systemName: "globe")
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                                .frame(width: 20)
                                            Text(website)
                                                .font(.body)
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    
                                    if let email = business.email {
                                        HStack(spacing: 8) {
                                            Image(systemName: "envelope.fill")
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                                .frame(width: 20)
                                            Text(email)
                                                .font(.body)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }
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
        .presentationDetents([.fraction(0.67), .large])
        .presentationDragIndicator(.visible)
        .presentationBackgroundInteraction(.enabled)
        .interactiveDismissDisabled(false)
        .presentationBackground(.white)
    }
}

#Preview {
    BusinessModalView(business: SampleData.businesses[0]) {
        // Dismiss action
    }
}

