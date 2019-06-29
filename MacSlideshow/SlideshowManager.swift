//
//  SlideshowManager.swift
//  MacSlideshow
//
//  Created by Bailey Seymour on 6/28/19.
//  Copyright © 2019 Bailey Seymour. All rights reserved.
//

import AppKit

class SlideshowManager {
    
    var imageFilenames: [String] = []
    var currentPosition: Int = -1 {
        didSet {
            if currentPosition >= imageFilenames.count {
                currentPosition = 0
            }
        }
    }
    let directoryPath: String
    
    var currentImage: NSImage? {
        if currentPosition > -1 && currentPosition < imageFilenames.count {
            return NSImage(contentsOfFile: "\(directoryPath)/\(imageFilenames[currentPosition])")
        }
        return nil
    }
    
    init(directoryPath: String) {
        self.directoryPath = directoryPath
        let fileManager = FileManager.default
        do {
            imageFilenames = try fileManager.contentsOfDirectory(atPath: directoryPath)
            imageFilenames.sort()
            imageFilenames = imageFilenames.filter { (filename) -> Bool in
                filename.lowercased().hasSuffix("jpg") || filename.lowercased().hasSuffix("png") || filename.lowercased().hasSuffix("jpeg") || filename.lowercased().hasSuffix("heic")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func shuffle() {
        imageFilenames.shuffle()
        currentPosition = 0
    }
}
