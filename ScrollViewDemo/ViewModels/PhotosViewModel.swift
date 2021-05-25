//
//  PhotosViewModel.swift
//  ScrollViewDemo
//
//  Created by Kyle Musco on 5/24/21.
//

import Foundation
import Combine

class PhotosViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    
    private let pexelsController: PexelsController
    
    private var cancellables: Set<AnyCancellable> = []
    private var currentSearchResponse: SearchResponse? = nil {
        didSet {
            photos = currentSearchResponse?.photos ?? []
        }
    }
    
    init(pexelsController: PexelsController = PexelsController()) {
        self.pexelsController = pexelsController
        loadPhotosIfNeeded()
    }
    
    // Retrieves search response and saves it in the view model
    func loadPhotosIfNeeded() {
        pexelsController.getSearchResponse()
            .receive(on: RunLoop.main)
            .compactMap({ $0 })
            // We can't use .assign if an error is returned so log the error and return nil
            .catch({error -> Just<SearchResponse?> in
                print(error.localizedDescription)
                return Just(nil)
            })
            .assign(to: \.currentSearchResponse, on: self)
            .store(in: &cancellables)
    }
}
