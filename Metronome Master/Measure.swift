//
//  Measure.swift
//  Metronome Master
//
//  Created by Andrew Paterson on 5/10/15.
//  Copyright (c) 2015 Andrew Paterson. All rights reserved.
//

import UIKit

class Measure: NSObject {
    
    var numberOfBeats: Int = 4
    
    var beatNote: Int = 4
    
    var beats: Array<Beat> = []
    
    var time: Double = 4
    
    var accented: Bool = true
    
    var subdivisions: Int = 2
    
    var currentBeat: Int = 0
    
    override init() {
        
        super.init()
        
        generateBeats()
        
    }
   
    func generateBeats() {
        
        for (var i = 0; i < numberOfBeats; i++) {
            
            let beat = Beat()
            beat.time = time/numberOfBeats.double
            beat.accented = accented
            beat.subdivisions = subdivisions
            beat.generateSounds()
            
            i == 0 ? beats = [beat] : beats.insert(beat, atIndex: i)
            
        }
        
    }
    
    func playBeats() {
        
        if currentBeat < numberOfBeats {
            beats[numberOfBeats].playSound()
            NSTimer.scheduledTimerWithTimeInterval(time / numberOfBeats.double, target: self, selector: Selector("playBeats"), userInfo: nil, repeats: false)
        }
        
    }
    
}

