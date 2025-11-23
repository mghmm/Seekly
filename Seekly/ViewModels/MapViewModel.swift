//
//  MapViewModel.swift
//  Seekly
//
//  Created by Mike Merkelbag on 23/11/25.
//

import SwiftUI
import MapKit
import Combine

@MainActor
class MapViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var position: MapCameraPosition
    @Published var selectedBusiness: Business?
    @Published var hasInitializedLocation = false
    @Published var businesses: [Business] = []
    
    // MARK: - Dependencies
    private let locationManager: LocationManager
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Constants
    private let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    private let selectedBusinessSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    private let centerOffset: Double = 0.0025
    
    // MARK: - Initialization
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        
        // Initialize with default San Francisco location
        self.position = .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                span: defaultSpan
            )
        )
        
        // Load businesses (in future, this would come from a service)
        self.businesses = SampleData.businesses
        
        setupLocationObserver()
    }
    
    // MARK: - Public Methods
    func recenterOnUserLocation() {
        guard let location = locationManager.userLocation else { return }
        
        withAnimation(.easeInOut(duration: 0.5)) {
            position = .region(
                MKCoordinateRegion(
                    center: location,
                    span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
                )
            )
        }
    }
    
    func selectBusiness(_ business: Business) {
        selectedBusiness = business
        centerOnBusiness(business)
    }
    
    func deselectBusiness() {
        selectedBusiness = nil
    }
    
    // MARK: - Private Methods
    private func setupLocationObserver() {
        locationManager.$userLocation
            .compactMap { $0 }
            .sink { [weak self] location in
                guard let self = self, !self.hasInitializedLocation else { return }
                
                self.position = .region(
                    MKCoordinateRegion(
                        center: location,
                        span: self.defaultSpan
                    )
                )
                self.hasInitializedLocation = true
            }
            .store(in: &cancellables)
    }
    
    private func centerOnBusiness(_ business: Business) {
        // Offset the center downward to shift the marker up into the visible top 1/3
        // The sheet covers 2/3 from bottom
        let offsetCenter = CLLocationCoordinate2D(
            latitude: business.coordinate.clCoordinate.latitude - centerOffset,
            longitude: business.coordinate.clCoordinate.longitude
        )
        
        withAnimation(.easeInOut(duration: 0.9)) {
            position = .region(
                MKCoordinateRegion(
                    center: offsetCenter,
                    span: selectedBusinessSpan
                )
            )
        }
    }
}

