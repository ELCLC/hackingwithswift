//
//  DetailViewPresenter.swift
//  Project1
//
//  Created by Emma Lee-Choon on 12/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

enum LargeTitleDisplayMode: Int {
    case automatic
    case always
    case never
}
class DetailViewPresenter {
    
    weak var view: DetailViewProtocol!
    let interactor: StormViewerInteractor!
    let selectedImage: StormViewerImage?
    
    init(interactor: StormViewerInteractor, id: Int) {
        self.interactor = interactor
        selectedImage = interactor.getImage(id: id)
    }
    
    func viewReady() {
        view.set(largeTitleDisplayMode: LargeTitleDisplayMode.never)
        if let image = selectedImage {
            view.set(imageName: image.imageName)
        }
    }
}
