//
//  FileManager.swift
//  CacheImagesInSwiftUI
//

import SwiftUI

class PhotoFileManager {
    
    static let instance = PhotoFileManager()
    
    let folderName = "downloaded_photos"
    
    private init () {
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() {
        guard let url = getFolderPath() else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(
                    at: url,
                    withIntermediateDirectories: true,
                    attributes: nil
                )
            } catch {
                print(error)
            }
        }
    }
    
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?.appendingPathComponent(folderName)
    }
    
    
     func add(key: String, image: UIImage) {
        guard
            let data = image.pngData(),
                let url = getImagePath(key: key) else { return }
        
        do {
            try data.write(to: url)
        } catch  {
            print(error)
        }
    }
    
    func delete(key: String) {
        guard let url = getImagePath(key: key) else { return }
        
        do {
            try FileManager.default.removeItem(at: url)
        } catch  {
            print(error)
        }
        
    }
    
    func get(key: String) -> UIImage? {
        guard
            let url = getImagePath(key: key),
            FileManager.default.fileExists(atPath: url.path) else { return nil }
        
        return UIImage(contentsOfFile: url.path)
    }

    func getImagePath(key: String) -> URL? {
        guard let folder = getFolderPath() else { return nil }
        return folder.appendingPathComponent(key + ".png")
    }
    
}
