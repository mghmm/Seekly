//
//  SearchViewModel.swift
//  Seekly
//
//  Created by Mike Merkelbag on 23/11/25.
//

import SwiftUI
import Combine

@MainActor
class SearchViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var searchQuery: String = ""
    @Published var searchResults: [SearchResult] = []
    @Published var isSearching: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init(initialQuery: String = "") {
        self.searchQuery = initialQuery
        performSearch()
    }
    
    // MARK: - Public Methods
    func performSearch() {
        isSearching = true
        
        // Currently using dummy data, but this would be where you'd call your API
        searchResults = SampleData.dummySearch(query: searchQuery)
        
        isSearching = false
    }
    
    func updateQuery(_ query: String) {
        searchQuery = query
        performSearch()
    }
}

