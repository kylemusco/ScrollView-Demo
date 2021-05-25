//
//  PhotosView.swift
//  ScrollViewDemo
//
//  Created by Kyle Musco on 5/24/21.
//

import SwiftUI

struct PhotosView: View {
    @ObservedObject private var photosViewModel = PhotosViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(photosViewModel.photos) { photo in
                    PhotoView(photo: photo)
                }
            }
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
