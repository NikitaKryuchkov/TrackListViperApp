//
//  TrackListConfigurator.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 28.08.2021.
//

import Foundation

protocol TrackListConfiguratorInputProtocol {
    func configure(with viewController: TrackListViewController)
}

class TrackListConfigurator: TrackListConfiguratorInputProtocol {
    func configure(with viewController: TrackListViewController) {
        let presentr = TrackListPresenter(view: viewController)
        let interactor = TrackListInteractor(presentr: presentr)
        let router = TrackListRouter(viewController: viewController)
        
        viewController.presenter = presentr
        presentr.interactor = interactor
        presentr.router = router
    }
    
    
}
