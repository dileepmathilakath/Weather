//
//  LocationListViewModel.swift
//  Weather
//
//  Created by Dileep M on 06/06/21.
//

import Foundation

protocol LocationListViewDelegate: AnyObject {
    func loadLocatons()
    func serviceError()
}

protocol LocationListViewProvider {
    var locations: [Location] { get }
    var numberOfRows: Int { get }
    var delegate: LocationListViewDelegate? { get set }
    func configure(_ cell: LocationListTableViewCell, of indexPath: IndexPath)
    func getLocations()
}

class LocationListViewModel: LocationListViewProvider {
    var locations: [Location] = []
    
    private var networkManager = NetworkManager()
    weak var delegate: LocationListViewDelegate?
    
    init() {
    }
    
    func getLocations() {
        getLocations(usingLat: "27.2046", long: "77.4977")
    }
    
    private func getLocations(usingLat lat: String, long: String) {
        let completion: ([Location]?, String?) -> () = {[weak self] locations, error in
            guard let self = self else { return }
            
            guard let locations = locations,
                  error == nil else {
                self.delegate?.serviceError()
                return
            }
            self.locations = locations
            self.delegate?.loadLocatons()
        }
        networkManager.getLocations(lat: lat,
                                    long: long,
                                    completion: completion)
    }
    
    func configure(_ cell: LocationListTableViewCell,
                   of indexPath: IndexPath) {
        let location = locations[indexPath.row]
        cell.configureView(title: location.title,
                           type: location.type,
                           identifier: String(location.woeid))
    }
    
    var numberOfRows: Int {
        locations.count
    }
    
}
