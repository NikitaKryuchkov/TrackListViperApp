//
//  TrackCell.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 30.08.2021.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

class TrackCellView: UITableViewCell, CellModelRepresentable {
    
    var viewModel: CellIdentifiable? {
        didSet{
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? TrackCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.trackName
        content.secondaryText = viewModel.artistName
        content.image = UIImage(named: viewModel.imageName)
        content.imageProperties.cornerRadius = CGFloat(viewModel.cellHeight / 2)
        contentConfiguration = content
    }
}

