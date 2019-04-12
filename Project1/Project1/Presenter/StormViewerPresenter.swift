//
//  StormViewerPresenter.swift
//  Project1
//
//  Created by Emma Lee-Choon on 12/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

class StormViewerPresenter {
    
    var interactor: StormViewerInteractorProtocol!
    var pictures: [StormViewerImage]!
    weak var view: StormViewerViewProtocol?
    var selectedId: Int?
    
    init(interactor: StormViewerInteractorProtocol) {
        self.interactor = interactor
    }
    
    func viewReady() {
        pictures = interactor.getImages()
        view?.set(largeTitles: true)
        view?.set(title: interactor.getTitle())
    }
    
    func numberOfRows() -> Int {
        return pictures.count
    }
    
    func text(at row: Int) -> String? {
        return pictures.first { $0.id == row }?.imageName
    }
    
    func didSelect(row: Int) {
        selectedId = row
        view?.navigateToDetail()
    }
}
