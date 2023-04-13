//
//  MainPresenter.swift
//  MVPLevelOne
//
//  Created by Кирилл Бережной on 03.04.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func sucess()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOnTheComment(comment: Comment?)
}

class MainPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    var comments: [Comment]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }
    
    func getComments() {
        self.networkService.getComments { [weak self] result in
            guard let self = self else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let comments):
                        self.comments = comments
                        self.view?.sucess()
                    case .failure(let error):
                        self.view?.failure(error: error)
                    }
                }
        }
    }
    
    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
    
}
