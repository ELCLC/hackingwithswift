//
//  DetailViewRouter.swift
//  Project3
//
//  Created by Emma Lee-Choon on 12/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

class DetailViewRouter {
    
    let interactor: StormViewerInteractorProtocol!
    
    init(interactor: StormViewerInteractorProtocol) {
        self.interactor = interactor
    }
    
    func assemble(viewController: DetailViewController, id: Int) {
        let presenter = DetailViewPresenter(interactor: interactor, id: id)
        presenter.view = viewController
        viewController.presenter = presenter
        viewController.router = self
    }
}
