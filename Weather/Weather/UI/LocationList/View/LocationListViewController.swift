//
//  LocationListViewController.swift
//  Weather
//
//  Created by Dileep M on 06/06/21.
//

import UIKit

class LocationListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: LocationListViewProvider! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        viewModel = LocationListViewModel()
        fetchLocations() 
    }
    
    // MARK: Custom
    private func registerCells() {
        tableView.registerNib(LocationListTableViewCell.self)
    }
    
    private func fetchLocations() {
        viewModel.getLocations()
        toggleActivityWith(toggleValue: true)
    }
    
}

// MARK: - UITableViewDataSource
extension LocationListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationListTableViewCell.reusableIdentifier, for: indexPath) as? LocationListTableViewCell else {
           return LocationListTableViewCell()
        }
        viewModel.configure(cell, of: indexPath)
        return cell
    }
}

// MARK: - LocationListViewDelegate
extension LocationListViewController: LocationListViewDelegate {
    func serviceError() {
        DispatchQueue.main.async {
            self.toggleActivityWith(toggleValue: false)
        }
    }
    
    func loadLocatons() {
        DispatchQueue.main.async {
            self.toggleActivityWith(toggleValue: false)
            self.tableView.reloadData()
        }
    }
    
}
