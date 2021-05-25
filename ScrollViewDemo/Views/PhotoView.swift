//
//  PhotoView.swift
//  ScrollViewDemo
//
//  Created by Kyle Musco on 5/24/21.
//

import SwiftUI

struct PhotoView: View {
    private var photo: Photo
    
    var body: some View {
        VStack(alignment: .trailing) {
            PhotoSourceView(photoSource: photo.src, loadingColor: Color(photo.avgColor))
                .padding()
                .scaledToFit()

            Text(photo.photographer)
                .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.secondary)
        )
        .padding()
    }
    
    init(photo: Photo) {
        self.photo = photo
    }
}
