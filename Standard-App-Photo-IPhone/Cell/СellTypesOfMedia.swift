//
//  СellTypesOfMedia.swift
//  Standard-App-Photo-IPhone
//
//  Created by Артем on 11.08.2021.
//

import UIKit

class СellTypesOfMedia: UICollectionViewCell {
    
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
        label.font = UIFont(name: "system", size: 18)
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var titleCount: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "system", size: 18)
        label.textColor = .gray
        return label
    }()
    
    lazy var titleImage: UIImageView = {
        let titleImage = UIImageView()
        return titleImage
    } ()

   private lazy var actionRightImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "thanMore")
            return image
        } ()
}

// MARK: - Setup Layout

extension СellTypesOfMedia {
    
    private func setupUI() {
        
        self.contentView.addSubview(titleImage)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(titleCount)
        self.contentView.addSubview(actionRightImage)
        
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleCount.translatesAutoresizingMaskIntoConstraints = false
        actionRightImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleImage.widthAnchor.constraint(equalToConstant:30),
            titleImage.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: titleImage.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: titleImage.leadingAnchor, constant: 50),
            
            titleCount.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleCount.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            titleCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            actionRightImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            actionRightImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            actionRightImage.widthAnchor.constraint(equalToConstant: 6),
            actionRightImage.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
}


