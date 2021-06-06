//
//  LocationListTableViewCell.swift
//  Weather
//
//  Created by Dileep M on 06/06/21.
//

import UIKit

class LocationListTableViewCell: UITableViewCell {
    
    // MARK: IBOultets
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    // MARK: Internal
    func configureView(title: String?,
                       type: String?,
                       identifier: String?) {
        identifierLabel.text = identifier
        titleLabel.text = title
        typeLabel.text = type
    }
    
    // MARK: Private
    private func configureUI() {
    }
    
}



