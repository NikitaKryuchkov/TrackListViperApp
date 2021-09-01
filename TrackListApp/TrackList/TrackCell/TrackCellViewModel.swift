//
//  TrackCellViewModel.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 30.08.2021.
//

import Foundation

protocol CellIdentifiable  {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
}

class TrackCellViewModel: CellIdentifiable {
    var trackName: String
    var artistName: String
    var imageName: String

    var cellHeight: Double {
        80
    }

    var cellIdentifier: String {
        "trackName"
    }

    required init(track: Track) {
        trackName = track.song
        artistName = track.artist
        imageName = track.title
    }
}
