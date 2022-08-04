//
//  SaveMassageView.swift
//  CacheImagesInSwiftUI
//
import SwiftUI

struct MessageView: View {
    let text: String
    let isShowingMassage: Bool
    var body: some View {
        Rectangle()
            .opacity(0)
            .background(.ultraThinMaterial)
            .frame(width: 200,
                   height: 200)
            .cornerRadius(10)
            .overlay(
                Text(text)
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: UIScreen.main.bounds.height / 30))
            )
            .opacity(isShowingMassage ? 1 : 0)
            .animation(.default, value: isShowingMassage)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(text: "text", isShowingMassage: true)
    }
}
