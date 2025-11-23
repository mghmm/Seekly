//
//  SampleData.swift
//  Seekly
//
//  Created by Mike Merkelbag on 21/11/25.
//

import Foundation

struct SampleData {
    static let businesses: [Business] = [
        // Coffee Shops
        Business(
            id: "1",
            name: "Brother Baba Budan",
            category: "Coffee & Tea",
            rating: 4.5,
            reviewCount: 856,
            priceLevel: 2,
            imageUrl: nil,
            isOpen: true,
            distance: 250,
            coordinate: Business.Coordinate(latitude: -37.8118, longitude: 144.9633),
            address: "359 Little Bourke St, Melbourne VIC 3000",
            phoneNumber: "(03) 9606 0449",
            website: nil,
            email: nil,
            emoji: "☕️",
            description: "A cozy laneway cafe serving specialty coffee and fresh pastries. Known for their almond croissants and friendly baristas."
        ),
        Business(
            id: "2",
            name: "Market Lane Coffee",
            category: "Coffee & Tea",
            rating: 4.7,
            reviewCount: 1243,
            priceLevel: 2,
            imageUrl: nil,
            isOpen: true,
            distance: 180,
            coordinate: Business.Coordinate(latitude: -37.8141, longitude: 144.9625),
            address: "Therry St, Melbourne VIC 3000",
            phoneNumber: "(03) 9670 3899",
            website: "https://marketlane.com.au",
            email: "info@marketlane.com.au",
            emoji: "☕️",
            description: "Award-winning coffee roaster with multiple locations across Melbourne. Famous for their signature blends and delicious almond croissants baked fresh daily."
        ),
        Business(
            id: "3",
            name: "Dukes Coffee Roasters",
            category: "Coffee & Tea",
            rating: 4.6,
            reviewCount: 632,
            priceLevel: 2,
            imageUrl: nil,
            isOpen: true,
            distance: 320,
            coordinate: Business.Coordinate(latitude: -37.8125, longitude: 144.9655),
            address: "247 Flinders Ln, Melbourne VIC 3000",
            phoneNumber: "(03) 9654 7373",
            website: nil,
            email: nil,
            emoji: "☕️",
            description: nil
        ),
        
        // Restaurants
        Business(
            id: "4",
            name: "Chin Chin",
            category: "Thai Restaurant",
            rating: 4.4,
            reviewCount: 2341,
            priceLevel: 3,
            imageUrl: nil,
            isOpen: true,
            distance: 420,
            coordinate: Business.Coordinate(latitude: -37.8148, longitude: 144.9658),
            address: "125 Flinders Ln, Melbourne VIC 3000",
            phoneNumber: "(03) 8663 2000",
            website: nil,
            email: nil,
            emoji: "🍽️",
            description: nil
        ),
        Business(
            id: "5",
            name: "Supernormal",
            category: "Asian Fusion",
            rating: 4.5,
            reviewCount: 1876,
            priceLevel: 3,
            imageUrl: nil,
            isOpen: true,
            distance: 380,
            coordinate: Business.Coordinate(latitude: -37.8132, longitude: 144.9642),
            address: "180 Flinders Ln, Melbourne VIC 3000",
            phoneNumber: "(03) 9650 8688",
            website: nil,
            email: nil,
            emoji: "🍽️",
            description: nil
        ),
        Business(
            id: "6",
            name: "Coda",
            category: "Modern Australian",
            rating: 4.3,
            reviewCount: 945,
            priceLevel: 3,
            imageUrl: nil,
            isOpen: false,
            distance: 290,
            coordinate: Business.Coordinate(latitude: -37.8128, longitude: 144.9638),
            address: "141 Flinders Ln, Melbourne VIC 3000",
            phoneNumber: "(03) 9650 3155",
            website: nil,
            email: nil,
            emoji: "🍽️",
            description: nil
        ),
        
        // Bars
        Business(
            id: "7",
            name: "Bar Americano",
            category: "Bar",
            rating: 4.6,
            reviewCount: 578,
            priceLevel: 2,
            imageUrl: nil,
            isOpen: true,
            distance: 310,
            coordinate: Business.Coordinate(latitude: -37.8122, longitude: 144.9615),
            address: "20 Presgrave Pl, Melbourne VIC 3000",
            phoneNumber: nil,
            website: nil,
            email: nil,
            emoji: "🍸",
            description: nil
        ),
        Business(
            id: "8",
            name: "Eau De Vie",
            category: "Cocktail Bar",
            rating: 4.7,
            reviewCount: 892,
            priceLevel: 3,
            imageUrl: nil,
            isOpen: true,
            distance: 450,
            coordinate: Business.Coordinate(latitude: -37.8145, longitude: 144.9670),
            address: "1 Malthouse Ln, Melbourne VIC 3000",
            phoneNumber: "(03) 9663 9899",
            website: nil,
            email: nil,
            emoji: "🍸",
            description: nil
        ),
        
        // Cafes & Bakeries
        Business(
            id: "9",
            name: "Brunetti",
            category: "Italian Cafe & Bakery",
            rating: 4.2,
            reviewCount: 1567,
            priceLevel: 2,
            imageUrl: nil,
            isOpen: true,
            distance: 520,
            coordinate: Business.Coordinate(latitude: -37.8160, longitude: 144.9628),
            address: "380 Lonsdale St, Melbourne VIC 3000",
            phoneNumber: "(03) 9663 7666",
            website: nil,
            email: nil,
            emoji: "🥐",
            description: nil
        ),
        Business(
            id: "10",
            name: "Hopetoun Tea Rooms",
            category: "Cafe & Tea Room",
            rating: 4.4,
            reviewCount: 734,
            priceLevel: 3,
            imageUrl: nil,
            isOpen: true,
            distance: 280,
            coordinate: Business.Coordinate(latitude: -37.8155, longitude: 144.9638),
            address: "Block Arc, 282 Collins St, Melbourne VIC 3000",
            phoneNumber: "(03) 9650 2777",
            website: nil,
            email: nil,
            emoji: "🥐",
            description: nil
        ),
        
        // Fast Food & Quick Bites
        Business(
            id: "11",
            name: "Gelato Messina",
            category: "Gelato & Desserts",
            rating: 4.8,
            reviewCount: 2156,
            priceLevel: 2,
            imageUrl: nil,
            isOpen: true,
            distance: 340,
            coordinate: Business.Coordinate(latitude: -37.8142, longitude: 144.9652),
            address: "Cnr Hardware &, Lt Bourke St, Melbourne VIC 3000",
            phoneNumber: "(03) 9078 7314",
            website: nil,
            email: nil,
            emoji: "🍨",
            description: nil
        ),
        Business(
            id: "12",
            name: "Grill'd Healthy Burgers",
            category: "Burger Joint",
            rating: 4.1,
            reviewCount: 623,
            priceLevel: 2,
            imageUrl: nil,
            isOpen: true,
            distance: 230,
            coordinate: Business.Coordinate(latitude: -37.8138, longitude: 144.9618),
            address: "148 Bourke St, Melbourne VIC 3000",
            phoneNumber: "(03) 9654 8008",
            website: nil,
            email: nil,
            emoji: "🍔",
            description: nil
        ),
        
        // Shopping
        Business(
            id: "13",
            name: "Melbourne Central",
            category: "Shopping Mall",
            rating: 4.3,
            reviewCount: 4521,
            priceLevel: 2,
            imageUrl: nil,
            isOpen: true,
            distance: 650,
            coordinate: Business.Coordinate(latitude: -37.8102, longitude: 144.9629),
            address: "211 La Trobe St, Melbourne VIC 3000",
            phoneNumber: "(03) 9660 3400",
            website: nil,
            email: nil,
            emoji: "🛍️",
            description: nil
        ),
        Business(
            id: "14",
            name: "QV Melbourne",
            category: "Shopping Center",
            rating: 4.2,
            reviewCount: 2834,
            priceLevel: 2,
            imageUrl: nil,
            isOpen: true,
            distance: 480,
            coordinate: Business.Coordinate(latitude: -37.8095, longitude: 144.9653),
            address: "292 Swanston St, Melbourne VIC 3000",
            phoneNumber: "(03) 9657 3500",
            website: nil,
            email: nil,
            emoji: "🛍️",
            description: nil
        ),
        
        // Entertainment
        Business(
            id: "15",
            name: "ACMI Cinema",
            category: "Cinema",
            rating: 4.5,
            reviewCount: 1245,
            priceLevel: 2,
            imageUrl: nil,
            isOpen: true,
            distance: 780,
            coordinate: Business.Coordinate(latitude: -37.8188, longitude: 144.9691),
            address: "Fed Square, Melbourne VIC 3000",
            phoneNumber: "(03) 8663 2583",
            website: nil,
            email: nil,
            emoji: "🎬",
            description: nil
        )
    ]
    
    // Filter businesses by category
    static func businesses(forCategory category: String) -> [Business] {
        businesses.filter { $0.category.localizedCaseInsensitiveContains(category) }
    }
    
    // Filter businesses by search query
    static func businesses(matching query: String) -> [Business] {
        guard !query.isEmpty else { return businesses }
        
        return businesses.filter { business in
            business.name.localizedCaseInsensitiveContains(query) ||
            business.category.localizedCaseInsensitiveContains(query) ||
            business.address.localizedCaseInsensitiveContains(query)
        }
    }
    
    // MARK: - Dummy Search Function
    /// Dummy search function that always returns three coffee places from sample data
    /// Use this for UI development without implementing real search functionality
    static func dummySearch(query: String) -> [SearchResult] {
        // Returns the first three coffee shops with confidence values
        return [
            SearchResult(business: businesses[1], confidence: "surely"),    // Market Lane Coffee
            SearchResult(business: businesses[0], confidence: "possibly"),   // Brother Baba Budan
            SearchResult(business: businesses[2], confidence: "possibly")    // Dukes Coffee Roasters
        ]
    }
}

