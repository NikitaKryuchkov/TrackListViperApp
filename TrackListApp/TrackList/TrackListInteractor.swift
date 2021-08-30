//
//  TrackListInteractor.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 28.08.2021.
//

import Foundation

protocol TrackListInteractorInputProtocol: AnyObject {
    init (presentr: TrackListInteractorOutputProtocol)
    func getTrackList()
    func getTrack(at indexPath: IndexPath)
}

protocol TrackListInteractorOutputProtocol: AnyObject {
    func trackListDidReceive(_ tracks: [Track])
    func trackDidReceive(_ track: Track)
}

class TrackListInteractor: TrackListInteractorInputProtocol {
    unowned let presentr: TrackListInteractorOutputProtocol
    
    required init(presentr: TrackListInteractorOutputProtocol) {
        self.presentr = presentr
    }
    
    func getTrackList() {
        let tracks = Track.getTrackList()
        presentr.trackListDidReceive(tracks)
    }
    
    func getTrack(at indexPath: IndexPath) {
        let tracks = Track.getTrackList()
        let track = tracks[indexPath.row]
        presentr.trackDidReceive(track)
    }
}
