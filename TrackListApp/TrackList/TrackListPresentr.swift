//
//  TrackListPresentr.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 28.08.2021.
//

import Foundation

class TrackListPresenter: TrackListViewOutputProtocol {
    
    unowned let view: TrackListViewInputProtocol
    var interactor: TrackListInteractorInputProtocol!
    var router: TrackListRouterInputProtocol!
    
    required init(view: TrackListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.getTrackList()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        interactor.getTrack(at: indexPath)
    }
    
    func movedRow(from sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        interactor.getChangesTrackList(from: sourceIndexPath, to: destinationIndexPath)
    }
}

// MARK: - TrackListInteractorOutputProtocol
extension TrackListPresenter: TrackListInteractorOutputProtocol {
    func trackDidReceive(_ track: Track) {
        router.openTrackDetailsViewController(with: track)
    }
    
    func trackListDidReceive(_ tracks: [Track]) {
        var rows: [TrackCellViewModel] = []
        tracks.forEach { rows.append(TrackCellViewModel(track: $0)) }
        
        view.reloadData(for: rows)
    }
}
