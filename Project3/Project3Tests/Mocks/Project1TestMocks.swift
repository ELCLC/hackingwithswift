//
//  Project3TestMocks.swift
//  Project3Tests
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import Foundation
import UIKit
@testable import Project3

class MockInteractor: StormViewerInteractorProtocol {
    var getImagesCalled = false
    
    func getImages() -> [StormViewerImage] {
        getImagesCalled = true
        return []
    }
    
    func getTitle() -> String {
        return "Title"
    }
    
    func getImage(id: Int) -> StormViewerImage? {
        if id == 10 {
            return StormViewerImage(id: 10, imageName: "TestImage")
        }
        return nil
    }
}

class MockStormViewerPresenter: StormViewerPresenter {
    var numberOfRowsCalled = false
    var textAtRowCalled = false
    var didSelectRowCalled = false
    
    override func numberOfRows() -> Int {
        numberOfRowsCalled = true
        return 1
    }
    
    override func text(at row: Int) -> String? {
        textAtRowCalled = true
        return "Test"
    }
    
    override func didSelect(row: Int) {
        didSelectRowCalled = true
    }
}

class MockTableView: UITableView {
    
    override func dequeueReusableCell(withIdentifier identifier: String, for: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

class MockSegue: UIStoryboardSegue {
    
}

class MockDetailViewController: DetailViewController {
    
}

class MockStormViewerViewController: StormViewerViewController {
    
}

class MockStormViewerRouter: StormViewerRouter {
    var configureDetailCalled = false
    
    override func configureDetail(viewController: UIViewController, id: Int) {
        configureDetailCalled = true
    }
}

class MockStormViewerViewProtocol: StormViewerViewProtocol {
    var setLargeTitlesCalled = false
    var setTitleCalled = false
    var navigateToDetailCalled = false
    
    func set(largeTitles: Bool) {
        setLargeTitlesCalled = true
    }
    
    func set(title: String) {
        setTitleCalled = true
    }
    
    func navigateToDetail() {
        navigateToDetailCalled = true
    }
}

class MockDetailViewProtocol: DetailViewProtocol {
   
    var setLargeTitleDisplayModeCalled = false
    var setImageCalled = false
    var setTitleCalled = false
    var showShareOptionsCalled = false

    func set(largeTitleDisplayMode: LargeTitleDisplayMode) {
        setLargeTitleDisplayModeCalled = true
    }
    
    func set(image: String) {
        setImageCalled = true
    }
    
    func set(title: String) {
        setTitleCalled = true
    }
    
    func showShareOptions(imageTitle: String) {
        showShareOptionsCalled = true
    }
}

class MockDetailViewPresenter: DetailViewPresenter {
    var viewReadyCalled = false
    var shareTappedCalled = false
    
    override func viewReady() {
        viewReadyCalled = true
    }
    
    override func shareTapped() {
        shareTappedCalled = true
    }
}

class MockImageView: UIImageView {
    
}

class MockDetailViewRouter: DetailViewRouter {
    
}
