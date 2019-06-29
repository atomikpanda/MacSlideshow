//
//  AppDelegate.swift
//  MacSlideshow
//
//  Created by Bailey Seymour on 6/28/19.
//  Copyright © 2019 Bailey Seymour. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func playStop(_ sender: Any) {
        let vc = NSApplication.shared.mainWindow?.contentViewController as! ViewController
        vc.playStop()
    }
    
    @IBAction func shuffle(_ sender: Any) {
        let vc = NSApplication.shared.mainWindow?.contentViewController as! ViewController
        vc.shuffle()
    }
}

