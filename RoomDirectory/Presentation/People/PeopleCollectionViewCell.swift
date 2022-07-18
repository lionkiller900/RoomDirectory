//
//  PeopleCollectionViewCell.swift
//  RoomDirectory
//
//  Created by Admin on 18/07/2022.
//

import UIKit

final class PeopleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var posterImageViw: UIImageView!
    
    
    func configureData(people: PeopleRecord) {
        nameLabel.text = people.firstName + people.lastName
        titleLabel.text = people.jobTitle
        self.contentView.layer.borderColor = UIColor.blue.cgColor
        self.contentView.layer.borderWidth = 1.0
        
        posterImageViw.layer.cornerRadius = 35
        posterImageViw.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        nameLabel.text = ""
        posterImageViw.image = nil
        titleLabel.text = ""
    }
    
}

