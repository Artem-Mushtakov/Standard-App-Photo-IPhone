//
//  HeaderCellPeopleAndPlaces.swift
//  Standard-App-Photo-IPhone
//
//  Created by Артем on 11.08.2021.
//

import UIKit

class HeaderCellPeopleAndPlaces: UICollectionReusableView {
    
    // MARK: - Properties
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Люди и места"
        label.textColor  = .white
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Setup Layout
    
    public func configure() {
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
        ])
    }
}
