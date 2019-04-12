//
//  StormImageInteractor.swift
//  Project1
//
//  Created by Emma Lee-Choon on 12/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import Foundation

protocol StormViewerInteractorProtocol {
    func getImages() -> [StormViewerImage]
    func getTitle() -> String
    func getImage(id: Int) -> StormViewerImage?
}

class StormViewerInteractor: StormViewerInteractorProtocol {
    
    func getImages() -> [StormViewerImage] {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        var items = try! fm.contentsOfDirectory(atPath: path)
        var pictures = [StormViewerImage]()
        var imageId = 0
        
        items.sort()
        
        for i in 0..<items.count {
            let item = items[i]
            if item.hasPrefix("nssl") {
                pictures.append(StormViewerImage(id: imageId, imageName: item))
                imageId += 1
            }
        }
        
        return pictures
    }
    
    func getTitle() -> String {
        return "Storm Viewer"
    }
    
    func getImage(id: Int) -> StormViewerImage? {
        return getImages().first { $0.id == id }
    }
}
