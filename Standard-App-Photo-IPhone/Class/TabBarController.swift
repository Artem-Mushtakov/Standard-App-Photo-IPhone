//
//  TabBarController.swift
//  Standard-App-Photo-IPhone
//
//  Created by Артем on 02.08.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = .clear
        
        let mediaLibrary = MediaLibraryViewController()
        mediaLibrary.tabBarItem = UITabBarItem(title: "Медиатека",
                                               image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                               selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        
        let forYou = ForYouViewController()
        forYou.tabBarItem = UITabBarItem(title: "Для Вас",
                                         image: UIImage(systemName: "heart.text.square.fill"),
                                         selectedImage: UIImage(systemName: "heart.text.square.fill"))
        
        let albums = AlbumsViewController()
        albums.tabBarItem = UITabBarItem(title: "Альбомы",
                                         image: UIImage(systemName: "square.stack.fill"),
                                         selectedImage: UIImage(systemName: "square.stack.fill"))
        
        let Search = SearchViewController()
        Search.tabBarItem = UITabBarItem(title: "Поиск",
                                         image: UIImage(systemName: "magnifyingglass"),
                                         selectedImage: UIImage(systemName: "magnifyingglass"))
        
        self.viewControllers = [mediaLibrary, forYou, albums, Search]
    }
    
}

