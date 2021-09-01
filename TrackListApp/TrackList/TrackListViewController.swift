//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by Nikita Kryuchkov on 27.08.2021.
//

import UIKit

protocol TrackListViewInputProtocol: AnyObject {
    func reloadData(for row: [TrackCellViewModel])
}

protocol TrackListViewOutputProtocol: AnyObject {
    init(view: TrackListViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
    func movedRow(from sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
}

class TrackListViewController: UITableViewController {
    
    var presenter: TrackListViewOutputProtocol!
    let configurator: TrackListConfiguratorInputProtocol = TrackListConfigurator()
    private var rows: [TrackCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = rows[ indexPath.row ]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as! TrackCellView
        cell.viewModel = cellViewModel
        return cell
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(rows[indexPath.row].cellHeight)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        presenter.movedRow(from: sourceIndexPath, to: destinationIndexPath)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trackDetailsVC = segue.destination as! TrackDetailsViewController
        let configurator: TrackDetailsConfiguratorInputProtocol = TrackDetailsConfigurator()
        configurator.configure(with: trackDetailsVC, and: sender as! Track)
    }
}

// MARK: - TrackListViewInputProtocol
extension TrackListViewController: TrackListViewInputProtocol {
    func reloadData(for section: [TrackCellViewModel]) {
        rows = section
        tableView.reloadData()
    }
}
