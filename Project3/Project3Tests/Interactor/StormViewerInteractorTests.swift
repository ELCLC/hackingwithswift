//
//  StormViewerInteractorTests.swift
//  Project3Tests
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import XCTest
@testable import Project3

class StormViewerInteractorTests: XCTestCase {
    var stormViewerInteractor: StormViewerInteractor!
    
    override func setUp() {
        stormViewerInteractor = StormViewerInteractor()
    }

    override func tearDown() {
        stormViewerInteractor = nil
    }

    func testStormViewerInteractor_getImages_returnsArray() {
        let resultArray = stormViewerInteractor.getImages()
        
        XCTAssertNotNil(resultArray)
    }
    
    func testStormViewerInteractor_getTitle_returnsString() {
        let resultString = stormViewerInteractor.getTitle()
        
        XCTAssertTrue(resultString == "Storm Viewer")
    }
    
    func testStormViewerInteractor_getImage_returnsImage() {
        let resultImage = stormViewerInteractor.getImage(id: 0)
        
        XCTAssertNotNil(resultImage)
    }
    
    func testStormViewerInteractor_getImage_returnsNil() {
        let resultImage = stormViewerInteractor.getImage(id: 100)
        
        XCTAssertNil(resultImage)
    }
}
