//
//  TrackDetailsInteractor.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 28.08.2021.
//

import Foundation

protocol TrackDetailsInteractorInputProtocol: AnyObject {
    init(presentr: TrackDetailsInteractorOutputProtocol, track: Track)
    func provideTrackDetails()
}

protocol TrackDetailsInteractorOutputProtocol: AnyObject {
    func reciveCourseDetails(with track: Track)
}

class TrackDetailsInteractor: TrackDetailsInteractorInputProtocol {
    
    unowned let presentr: TrackDetailsInteractorOutputProtocol
    private let track: Track
    
    required init(presentr: TrackDetailsInteractorOutputProtocol, track: Track) {
        self.presentr = presentr
        self.track = track
    }
    
    func provideTrackDetails() {
        presentr.reciveCourseDetails(with: track)
    }
}
