//
//  UserDefaultsManager.swift
//  CacheImagesInSwiftUI
//

import Foundation

class UserDefaultsManager {
    
    static let instance = UserDefaultsManager()
    private init() { }
    
    func setAppTypeWith(_ type: AppType) {
        switch type {
        case .nsCache:
            UserDefaults.standard.set(0, forKey: "appType")
        case .fileManager:
            UserDefaults.standard.set(1, forKey: "appType")
        }
    }
    
    func getAppType() -> AppType {
        let typeNumber = UserDefaults.standard.integer(forKey: "appType")
        if typeNumber == 1 {
            return .fileManager
        } else {
            return .nsCache
        }
    }
    
}
