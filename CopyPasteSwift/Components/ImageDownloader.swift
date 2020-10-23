//
//  ImageDownloader.swift
//  CoreDataTut
//
//  Created by abuzeid on 23.09.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import Foundation
import UIKit
typealias DownloadImageCompletion = (UIImage?) -> Void
protocol ImageDownloaderType {
    func downloadImageWith(url: URL, completion: DownloadImageCompletion?) -> Disposable?
    func cached(url: String) -> UIImage?
}

public protocol Disposable {
    func dispose()
}

extension URLSessionDataTask: Disposable {
    public func dispose() {
        cancel()
    }
}

public final class ImageDownloader: ImageDownloaderType {
    func downloadImageWith(url: URL, completion: DownloadImageCompletion? = nil) -> Disposable? {
        if let data = cached(url: url.absoluteString) {
            completion?(data)
            return nil
        }
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                let image = UIImage(data: data) else {
                completion?(nil)
                return
            }
            completion?(image)
        }
        dataTask.resume()
        return dataTask
    }
}

// MARK: Caching

extension ImageDownloader {
    func cached(url: String) -> UIImage? {
        /// cach it yourself if you want
        return nil
    }
}

extension UIImageView {
    @discardableResult
    func setImage(with path: String) -> Disposable? {
        guard let url = URL(string: path) else { return nil }
        return ImageDownloader().downloadImageWith(url: url, completion: { [weak self] image in
            DispatchQueue.main.async {
                self?.image = image
            }
        })
    }
}
