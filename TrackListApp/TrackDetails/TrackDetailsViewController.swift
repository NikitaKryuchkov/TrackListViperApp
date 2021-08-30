//
//  TrackDetailsViewController.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 27.08.2021.
//

import UIKit

protocol TrackDetailsViewInputProtocol: AnyObject {
    func displayTrackTitle(with title: String)
    func displayImage(with image: String)
}

protocol TrackDetailsViewOutputProtocol: AnyObject {
    init(view: TrackDetailsViewInputProtocol)
    func showDetails()
}

class TrackDetailsViewController: UIViewController {

    @IBOutlet var imageCover: UIImageView!
    @IBOutlet var trackTitleLabel: UILabel!
    
    var presentr: TrackDetailsViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentr.showDetails()
    }
}

// MARK: - CourseDetailsViewInputProtocol
extension TrackDetailsViewController: TrackDetailsViewInputProtocol {
    func displayTrackTitle(with title: String) {
        trackTitleLabel.text = title
    }
    
    func displayImage(with image: String) {
        imageCover.image = UIImage(named: image)
    }
}
