//
//  TrackDetailsPresentr.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 28.08.2021.
//

import Foundation

class TrackDetailsPresentr: TrackDetailsViewOutputProtocol {
    
    unowned let view: TrackDetailsViewInputProtocol
    var interactor: TrackDetailsInteractorInputProtocol!
    
    required init(view: TrackDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideTrackDetails()
    }
}

// MARK: - TrackDetailsInteractorOutputProtocol
extension TrackDetailsPresentr: TrackDetailsInteractorOutputProtocol {
    func reciveCourseDetails(with track: Track) {
        view.displayImage(with: track.title)
        view.displayTrackTitle(with: track.title)
    }
    
    
}
