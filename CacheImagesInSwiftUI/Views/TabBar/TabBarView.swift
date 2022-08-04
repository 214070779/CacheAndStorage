//
//  TabBarView.swift
//  CacheImagesInSwiftUI
//
import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Main", systemImage: "photo")
                }
            
            SavedView()
                .tabItem {
                    Label("Saved", systemImage: "photo.on.rectangle")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
