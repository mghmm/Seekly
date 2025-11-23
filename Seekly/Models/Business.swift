//
//  Business.swift
//  Seekly
//
//  Created by Mike Merkelbag on 21/11/25.
//

import Foundation
import CoreLocation

struct Business: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let category: String
    let rating: Double
    let reviewCount: Int
    let priceLevel: Int // 1-4 dollar signs
    let imageUrl: String?
    let isOpen: Bool
    let distance: Double // in meters
    let coordinate: Coordinate
    let address: String
    let phoneNumber: String?
    let website: String?
    let email: String?
    let emoji: String
    let description: String?
    
    struct Coordinate: Codable, Equatable {
        let latitude: Double
        let longitude: Double
        
        var clCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
    
    var priceString: String {
        String(repeating: "$", count: priceLevel)
    }
    
    var distanceString: String {
        if distance < 1000 {
            return "\(Int(distance))m"
        } else {
            return String(format: "%.1fkm", distance / 1000)
        }
    }
}

// MARK: - Search Result
struct SearchResult: Identifiable {
    let business: Business
    let confidence: String // "surely" or "possibly"
    
    var id: String {
        business.id
    }
}

