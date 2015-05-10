//
//  Metronome_MasterTests.swift
//  Metronome MasterTests
//
//  Created by Andrew Paterson on 5/10/15.
//  Copyright (c) 2015 Andrew Paterson. All rights reserved.
//

import UIKit
import XCTest

class Metronome_MasterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBeatCreation() {
        
        let beat = Beat()
        beat.subdivisions = 8
        beat.time = 2
        beat.accented = true
        beat.generateSounds()
        
        XCTAssertEqual(beat.sounds.count, 8, "Incorrect Subdivision Count")
    
    }
    
    func testBeatPerformance() {
        
        self.measureBlock { () -> Void in
            
            let beat = Beat()
            beat.subdivisions = 8
            beat.time = 2
            beat.accented = true
            beat.generateSounds()
            
        }
        
    }
    
    func testMeasureCreation() {
        
        let measure = Measure()
        measure.time = 4
        measure.subdivisions = 2
        measure.accented = true
        measure.generateBeats()
        
        XCTAssertEqual(measure.beats.count, 4, "Incorrect Beat Count")
        
        XCTAssertEqual(measure.beats[0].sounds.count, 2, "Incorrect Subdivision Count In Measure")
        
    }
    
    func testMeasurePerformance() {
        
        self.measureBlock { () -> Void in
            
            let measure = Measure()
            measure.time = 4
            measure.subdivisions = 2
            measure.accented = true
            measure.generateBeats()
            
        }
        
    }
    
//    func testExample() {
//        // This is an example of a functional test case.
//        XCTAssert(true, "Pass")
//    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    
    
}
