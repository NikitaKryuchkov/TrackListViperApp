//
//  TrackDetailConfigurator.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 28.08.2021.
//

import Foundation

protocol TrackDetailsConfiguratorInputProtocol {
    func configure(with view: TrackDetailsViewController, and track: Track)
}

class TrackDetailsConfigurator: TrackDetailsConfiguratorInputProtocol {
    func configure(with view: TrackDetailsViewController, and track: Track) {
        let presentr = TrackDetailsPresentr(view: view)
        let interactor = TrackDetailsInteractor(presentr: presentr, track: track)
        
        view.presentr = presentr
        presentr.interactor = interactor
    }
}
