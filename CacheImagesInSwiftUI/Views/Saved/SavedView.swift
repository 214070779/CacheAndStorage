//
//  SavedImageView.swift
//  CacheImagesInSwiftUI
//

import SwiftUI

struct SavedView: View {
    @StateObject private var vm = SavedViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                content
                
                Spacer()
                
                CustomButton(title: "Delete",
                             color: .red,
                             action: {vm.deleteImage()},
                             width: UIScreen.main.bounds.width - 80)
                    .padding()
                
            }
            .navigationTitle(vm.title)
        }
        .onAppear {
            vm.setAppType()
            vm.fetchImage()
        }
    }
    
}

struct SavedImageView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}

extension SavedView {
    
    var content: some View {
        ZStack {
            if let image = vm.image {
                ImageView(image: image)
            } else {
                NoImageView()
            }
        }
    }
    
}
