//
//  StormViewerRouter.swift
//  Project1
//
//  Created by Emma Lee-Choon on 12/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import UIKit

class StormViewerRouter {
    
    let interactor: StormViewerInteractorProtocol!
    
    init(interactor: StormViewerInteractorProtocol) {
        self.interactor = interactor
    }
    
    func assemble(viewController: StormViewerViewController) {
        let presenter = StormViewerPresenter(interactor: interactor)
        viewController.router = self
        viewController.presenter = presenter
        presenter.view = viewController
    }
    
    func configureDetail(viewController: UIViewController, id: Int) {
        guard let detailViewController = viewController as? DetailViewController else {
            return
        }
        
        let detailViewRouter = DetailViewRouter(interactor: interactor)
        detailViewRouter.assemble(viewController: detailViewController, id: id)
    }
}
