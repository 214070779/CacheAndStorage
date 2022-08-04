//
//  SavedViewViewModel.swift
//  CacheImagesInSwiftUI
//

import SwiftUI

class SavedViewViewModel: ObservableObject {
    
    @Published var appType: AppType = .nsCache
    @Published var image: UIImage?
    @Published var title = ""
    
    init() {
        setAppType()
    }
    
    func setAppType() {
        appType = UserDefaultsManager.instance.getAppType()
        title = "From " + appType.rawValue
    }
    
    func fetchImage() {
        switch appType {
        case .nsCache: image = CacheManager.instance.get(name: "saved")
        case .fileManager: image = PhotoFileManager.instance.get(key: "saved")
        }
    }
    
    func deleteImage() {
        switch appType {
        case .nsCache: deleteFromCache()
        case .fileManager: deleteFromFileManager()
        }
    }
    
    private func deleteFromCache() {
        CacheManager.instance.remove(name: "saved")
        fetchImage()
    }
    
    private func deleteFromFileManager() {
        PhotoFileManager.instance.delete(key: "saved")
        fetchImage()
    }
    
}
