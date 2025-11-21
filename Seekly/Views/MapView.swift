//
//  MapView.swift
//  Seekly
//
//  Created by Mike Merkelbag on 21/11/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    @State private var hasInitializedLocation = false
    
    var body: some View {
        Map(position: $position, content: {
            // User location marker
            if let location = locationManager.userLocation {
                Annotation("", coordinate: location) {
                    UserLocationView(heading: locationManager.userHeading?.trueHeading)
                }
            }
            
            // Business markers
            ForEach(SampleData.businesses) { business in
                Annotation(business.name, coordinate: business.coordinate.clCoordinate) {
                    BusinessMarkerView(business: business)
                }
            }
        })
        .mapStyle(.standard(elevation: .realistic, pointsOfInterest: .excludingAll))
        .mapControls {
            // Hide all default controls including compass
        }
        .ignoresSafeArea()
        .onReceive(locationManager.$userLocation) { location in
            // Only center on user location once, on initial load
            if let location = location, !hasInitializedLocation {
                position = .region(
                    MKCoordinateRegion(
                        center: location,
                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    )
                )
                hasInitializedLocation = true
            }
        }
    }
}

// Custom user location view with directional cone
struct UserLocationView: View {
    let heading: CLLocationDirection?
    
    var body: some View {
        ZStack {
            // Directional cone (if heading available)
            if let heading = heading {
                DirectionalCone()
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: 60, height: 60)
                    .rotationEffect(.degrees(heading))
            }
            
            // Accuracy circle (pulse effect)
            Circle()
                .fill(Color.blue.opacity(0.15))
                .frame(width: 40, height: 40)
            
            // Main blue dot
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
                .overlay(
                    Circle()
                        .strokeBorder(Color.white, lineWidth: 3)
                )
                .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
        }
    }
}

// Custom shape for the directional cone
struct DirectionalCone: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        // Create a cone shape pointing upward (north)
        // Cone angle of about 45 degrees (22.5 degrees on each side)
        path.move(to: center)
        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(-22.5),
            endAngle: .degrees(22.5),
            clockwise: false
        )
        path.closeSubpath()
        
        return path
    }
}

// Business marker view
struct BusinessMarkerView: View {
    let business: Business
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                // White background circle
                Circle()
                    .fill(Color.white)
                    .frame(width: 36, height: 36)
                    .opacity(0.7)
                    .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: 1)
                
                // Emoji from business data
                Text(business.emoji)
                    .font(.system(size: 18))
                    .opacity(0.8)
            }
        }
    }
}

#Preview {
    MapView()
}

