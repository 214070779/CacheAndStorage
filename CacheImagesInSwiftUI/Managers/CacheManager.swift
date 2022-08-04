//
//  CacheManager.swift
//  CacheImagesInSwiftUI
//
//

import UIKit

class CacheManager {
    
    static let instance = CacheManager()
    private init() { }
    
   lazy var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
    }
    
    func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
    }
    
    func get(name: String) -> UIImage? {
        imageCache.object(forKey: name as NSString)
    }
    
}
