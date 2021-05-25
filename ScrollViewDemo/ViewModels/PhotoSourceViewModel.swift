//
//  PhotoSourceViewModel.swift
//  ScrollViewDemo
//
//  Created by Kyle Musco on 5/24/21.
//

import Foundation
import Combine
import UIKit

class PhotoSourceViewModel: ObservableObject {
    @Published var image: UIImage? = nil {
        didSet {
            loading = false
        }
    }
    @Published var loading: Bool = true
    
    private let imageController: ImageController
    private let photoSource: PhotoSource
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(photoSource: PhotoSource, imageController: ImageController = ImageController()) {
        self.photoSource = photoSource
        self.imageController = imageController
        
        loadImage()
    }
    
    // Download the image and store in this view model
    private func loadImage() {
        loading = true
        imageController.image(for: photoSource.medium)
            .receive(on: RunLoop.main)
            .assign(to: \.image, on: self)
            .store(in: &cancellables)
    }
}
