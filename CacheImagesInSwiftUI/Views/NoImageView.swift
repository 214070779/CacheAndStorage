//
//  NoImageView.swift
//  CacheImagesInSwiftUI
//
import SwiftUI

struct NoImageView: View {
    var body: some View {
        Text("?")
            .foregroundColor(.white)
            .bold()
            .font(.system(size: UIScreen.main.bounds.height / 8))
            .frame(width: 200, height: 200)
            .background(
                LinearGradient(colors: [.black,.black.opacity(0.8)], startPoint: .bottom, endPoint: .top)
                    .cornerRadius(10)
            )
    }
}

struct NoImageView_Previews: PreviewProvider {
    static var previews: some View {
        NoImageView()
    }
}
