//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 27.08.2021.
//

import UIKit

protocol TrackListViewInputProtocol: AnyObject {
    func reloadData(for section: TrackSectionViewModel)
}

protocol TrackListViewOutputProtocol: AnyObject {
    init(view: TrackListViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

class TrackListViewController: UITableViewController {
    
    private var trackList: [Track]!
    var presenter: TrackListViewOutputProtocol!
    let configurator: TrackListConfiguratorInputProtocol = TrackListConfigurator()
    private var sectionViewModel: SectionRowRepresentable = TrackSectionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        tableView.rowHeight = 80
        navigationItem.rightBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModel.rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = sectionViewModel.rows[ indexPath.row ]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as! TrackCellView
        cell.viewModel = cellViewModel
        return cell
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentTrack, at: destinationIndexPath.row)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let trackDetailsVC = segue.destination as? TrackDetailsViewController else { return }
//        guard let indexPath = tableView.indexPathForSelectedRow else { return }
//        let track = trackList[indexPath.row]
        trackDetailsVC.track = sender as? Track
    }
}

// MARK: - TrackListViewInputProtocol
extension TrackListViewController: TrackListViewInputProtocol {
    func reloadData(for section: TrackSectionViewModel) {
        sectionViewModel = section
        tableView.reloadData()
    }
}
