//
//  Project1TestMocks.swift
//  Project1Tests
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import Foundation
import UIKit
@testable import Project1

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
    var setLargetTitleDisplayModeCalled = false
    var setImageCalled = false
    var setTitleCalled = false
    
    func set(largeTitleDisplayMode: LargeTitleDisplayMode) {
        setLargetTitleDisplayModeCalled = true
    }
    
    func set(image: String) {
        setImageCalled = true
    }
    
    func set(title: String) {
        setTitleCalled = true
    }
}

class MockDetailViewPresenter: DetailViewPresenter {
    var viewReadyCalled = false
    
    override func viewReady() {
        viewReadyCalled = true
    }
}

class MockImageView: UIImageView {
    
}

class MockDetailViewRouter: DetailViewRouter {
    
}
