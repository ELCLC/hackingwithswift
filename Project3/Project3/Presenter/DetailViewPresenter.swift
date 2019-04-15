//
//  DetailViewPresenter.swift
//  Project3
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
    let interactor: StormViewerInteractorProtocol!
    let selectedImage: StormViewerImage?
    let imageCount: Int
    
    init(interactor: StormViewerInteractorProtocol, id: Int) {
        self.interactor = interactor
        selectedImage = interactor.getImage(id: id)
        imageCount = interactor.getImages().count
    }
    
    func viewReady() {
        view.set(largeTitleDisplayMode: LargeTitleDisplayMode.never)
        if let image = selectedImage {
            view.set(image: image.imageName)
            view.set(title: "Image \(image.id + 1) of \(imageCount)")
        }
    }
    
    func shareTapped() {
        view?.showShareOptions()
    }
}
