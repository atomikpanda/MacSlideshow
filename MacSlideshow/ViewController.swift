//
//  ViewController.swift
//  MacSlideshow
//
//  Created by Bailey Seymour on 6/28/19.
//  Copyright © 2019 Bailey Seymour. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    
    var slideshowManager: SlideshowManager?
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
        view.layer?.backgroundColor = .black
        
        
        
        slideshowManager = SlideshowManager(directoryPath: "\(NSHomeDirectory())/Desktop/slideshow")
    }
    
    func playStop() {
        
        if timer?.isValid ?? false {
            self.timer?.invalidate()
            self.timer = nil
            self.slideshowManager?.currentPosition = -1
            print("Stopped")
            NSCursor.unhide()
            return
        }
        
        NSCursor.hide()
        print("Play")
        self.timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { (timer) in
            self.loadImage()
        }
        loadImage()
    }
    
    func loadImage() {
        slideshowManager?.currentPosition += 1
        let image = slideshowManager?.currentImage
        imageView.image = image
    }
    
    func shuffle() {
        print("Shuffle")
        slideshowManager?.shuffle()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

