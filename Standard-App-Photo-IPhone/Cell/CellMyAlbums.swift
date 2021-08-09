//
//  CellMyAlbums.swift
//  Standard-App-Photo-IPhone
//
//  Created by Артем on 02.08.2021.
//

import UIKit

class CellMyAlbums: UICollectionViewCell {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    // MARK: - Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "system", size: 17)
        label.textColor = .white
        return label
    }()
    
    lazy var titleCount: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "system", size: 17)
        label.textColor = .gray
        return label
    }()
    
    lazy var titleImage: UIImageView = {
        let titleImage = UIImageView()
        
        return titleImage
    } ()
}

// MARK: - Setup Layout

extension CellMyAlbums {
    
    private func setupUI() {
        
        self.contentView.addSubview(titleImage)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(titleCount)
        
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleImage.clipsToBounds = true
        titleImage.layer.masksToBounds = true
        titleImage.layer.cornerRadius = 5
        titleImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleCount.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            titleImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            titleImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            titleImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            
            titleLabel.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
            
            titleCount.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            titleCount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            titleCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
        ])
    }
}
