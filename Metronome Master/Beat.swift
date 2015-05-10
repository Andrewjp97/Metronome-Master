//
//  Beat.swift
//  Metronome Master
//
//  Created by Andrew Paterson on 5/10/15.
//  Copyright (c) 2015 Andrew Paterson. All rights reserved.
//

import UIKit
import AVFoundation

extension Int {
    
    var double: Double {
        return Double(self)
    }
    
}

let accentedPath: String = NSBundle.mainBundle().pathForResource("AccentedSound", ofType: "mp3")!

let accentedURL: NSURL = NSURL(fileURLWithPath: accentedPath)!

let accentedSound: AVAudioPlayer = AVAudioPlayer(contentsOfURL: accentedURL, error: nil)

let regularPath = NSBundle.mainBundle().pathForResource("RegularSound", ofType: "mp3")

let regularURL = NSURL(fileURLWithPath: regularPath!)

let regularSound: AVAudioPlayer = AVAudioPlayer(contentsOfURL: regularURL, error: nil)

class Beat: NSObject {
   
    var subdivisions: Int = 0
    
    var accented: Bool = true
    
    var sounds: Array<AnyObject> = []
    
    var time: Double = 1.0
    
    var currentDivision = 0
    
    
    override init() {
        
        super.init()
        
        generateSounds()
        
    }
    
    func playSound() {
        
        if currentDivision < subdivisions {
            
            if let sound = sounds[subdivisions] as? AVAudioPlayer {
                
                sound.play()
                
                currentDivision++
                
                NSTimer.scheduledTimerWithTimeInterval(time / subdivisions.double, target: self, selector: Selector("playSound"), userInfo: nil, repeats: false)
                
            }
            
        }
        
    }
    
    func generateSounds() {
        
        var i = 0
        
        for (i = 0; i < subdivisions; i++) {
            
            if i == 0 {
                if accented {
                    sounds = [accentedSound]
                }
                else {
                    sounds = [regularSound]
                }
            }
            else {
                sounds.insert(regularSound, atIndex: i)
            }
            
        }
        
    }
    
}
