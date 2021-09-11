//
//  MediaLibraryViewController.swift
//  Standard-App-Photo-IPhone
//
//  Created by Артем on 02.08.2021.
//

import UIKit

class MediaLibraryViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Интерфейс ''Медиатеки'' (добавил для теста)"
        label.textColor = .systemGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    } ()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: - Setup Layout
    
    func setupLayout() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
