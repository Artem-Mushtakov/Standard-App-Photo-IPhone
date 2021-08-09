//
//  SearchViewController.swift
//  Standard-App-Photo-IPhone
//
//  Created by Артем on 02.08.2021.
//

import UIKit

class SearchViewController: UIViewController {
   
    // MARK: - Properties
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Интерфейс ''Поиска'' (добавил для теста)"
        label.textColor = .systemGray
        return label
    } ()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: - Setup
    
    func setupLayout() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
