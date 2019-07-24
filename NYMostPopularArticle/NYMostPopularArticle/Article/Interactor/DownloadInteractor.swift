//
//  DownloadInteractor.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation
import  UIKit

protocol DownloadImageInteractor {
    func startDownload(_ article: NYTimesArticle)
    func getImage(key: URL) -> UIImage?
    func saveDownload(sourceURL: URL, downloadingTo location: URL)
    func activeDownload(key: URL) -> Download?
}

enum CacheType {
    case inMemory
    case disk
}

class DownloadImageInteractorImpl : DownloadImageInteractor {
    
    private let downloadService: DownloadImageService
    private var cache: NSCache<AnyObject, AnyObject>
    private var type: CacheType = .disk

    init(downloadService: DownloadImageService) {
        self.downloadService = downloadService
        self.cache = NSCache()
    }
    
    func startDownload(_ article: NYTimesArticle) {
        self.downloadService.startDownload(article)
    }
    
    func getImage(key: URL) -> UIImage? {
        if self.type == .inMemory {
            return self.cache.object(forKey: key as AnyObject) as? UIImage
        } else {
            let downloadImageURL = self.downloadPath(for: key)
            return UIImage(contentsOfFile: downloadImageURL.path)
        }
    }
    
    func saveDownload(sourceURL: URL, downloadingTo location: URL) {
        var activeDownloads = self.downloadService.getActiveDownloads()
        let download = activeDownloads[sourceURL]
        activeDownloads[sourceURL] = nil
        
        if self.type == .inMemory , let image = UIImage(contentsOfFile: location.path) {
            self.cache.setObject(image, forKey: sourceURL as AnyObject)
            download?.article.isImageDownloaded = true
        } else {
            let destinationURL = self.downloadPath(for: sourceURL)
            let fileManager = FileManager.default
            try? fileManager.removeItem(at: destinationURL)
            do {
                try fileManager.copyItem(at: location, to: destinationURL)
                download?.article.isImageDownloaded = true
            } catch let error {
                print("Could not copy file to disk: \(error.localizedDescription)")
            }
        }
    }
    
    func activeDownload(key: URL) -> Download? {
        return self.downloadService.getActiveDownloads()[key]
    }
    
    private func downloadPath(for url: URL) -> URL {
        let documentsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return documentsPath.appendingPathComponent(url.lastPathComponent)
    }
}
