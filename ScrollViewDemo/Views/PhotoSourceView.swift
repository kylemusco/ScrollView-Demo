//
//  PhotoSourceView.swift
//  ScrollViewDemo
//
//  Created by Kyle Musco on 5/24/21.
//

import SwiftUI

struct PhotoSourceView: View {
    @ObservedObject private var photoSourceViewModel: PhotoSourceViewModel
    
    private let loadingColor: Color
    
    var body: some View {
        if photoSourceViewModel.loading {
            Rectangle()
                .fill(loadingColor)
        } else if let image = photoSourceViewModel.image {
            Image(uiImage: image)
                .resizable()
        } else {
            Text("Error loading image")
                .scaledToFit()
        }
    }
    
    init(photoSource: PhotoSource, loadingColor: Color) {
        self.loadingColor = loadingColor
        self.photoSourceViewModel = PhotoSourceViewModel(photoSource: photoSource)
    }
}
