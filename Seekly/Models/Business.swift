//
//  Business.swift
//  Seekly
//
//  Created by Mike Merkelbag on 21/11/25.
//

import Foundation
import CoreLocation

struct Business: Identifiable, Codable {
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
    let emoji: String
    
    struct Coordinate: Codable {
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

