//
//  DowloadedImageView.swift
//  CacheImagesInSwiftUI
//
import SwiftUI

struct ImageView: View {
    let image: UIImage?
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: UIImage(systemName: "heart"))
    }
}
