//
//  TrackListRouter.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 30.08.2021.
//

import Foundation

protocol TrackListRouterInputProtocol {
    init(viewController: TrackListViewController)
    func openTrackDetailsViewController(with track: Track)
}

class TrackListRouter: TrackListRouterInputProtocol {
    unowned let viewController: TrackListViewController
    
    required init(viewController: TrackListViewController) {
        self.viewController = viewController
    }
    
    func openTrackDetailsViewController(with track: Track) {
        viewController.performSegue(withIdentifier: "showDetails", sender: track)
    }
}
