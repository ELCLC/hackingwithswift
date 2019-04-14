//
//  FlagRouter.swift
//  Project2
//
//  Created by Emma Lee-Choon on 14/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import Foundation

class FlagRouter {
    
    init() {
        
    }
    
    func assemble(viewController: ViewController) {
        let interactor = FlagInteractor()
        let presenter = FlagPresenter(interactor: interactor)
        presenter.view = viewController
        viewController.presenter = presenter
    }
}
