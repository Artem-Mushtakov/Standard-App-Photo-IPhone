//
//  AlbumsViewController.swift
//  Standard-App-Photo-IPhone
//
//  Created by Артем on 02.08.2021.
//

import UIKit

enum CellType {
    case cellMyAlbums
    case cellPeopleAndPlaces
    case cellTypesOfMedia
}

class AlbumsViewController: UIViewController {
    
    // MARK: - Properties
    
    var data = [ "Section0": [ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums1")!),
                                titleLabel: "Недавние",
                                titleCount: "9 259"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums2")!),
                                titleLabel: "Избранное",
                                titleCount: "123"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums3")!),
                                titleLabel: "Instagram",
                                titleCount: "654"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums4")!),
                                titleLabel: "WhatsApp",
                                titleCount: "14"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums5")!),
                                titleLabel: "FaceApp",
                                titleCount: "321"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums6")!),
                                titleLabel: "Gradient",
                                titleCount: "456"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums3")!),
                                titleLabel: "Movavi Clips",
                                titleCount: "321"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums1")!),
                                titleLabel: "Недавние",
                                titleCount: "456")],
                 "Section1": [ModelCellMyAlbums(
                                type: .cellPeopleAndPlaces,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums1")!),
                                titleLabel: "Люди",
                                titleCount: "9 259"),
                              ModelCellMyAlbums(
                                type: .cellPeopleAndPlaces,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums2")!),
                                titleLabel: "Места",
                                titleCount: "123"),
                              ModelCellMyAlbums(
                                type: .cellPeopleAndPlaces,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums3")!),
                                titleLabel: "Разное",
                                titleCount: "654")],
                 "Section2": [ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums6")!),
                                titleLabel: "Недавние",
                                titleCount: "221"),
                              ModelCellMyAlbums(
                                type: .cellMyAlbums,
                                titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums6")!),
                                titleLabel: "Недавние",
                                titleCount: "221")],
    ]
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavigationBar()
        collectionView.collectionViewLayout = createCompositionalLayout() // ПОДПИСАЛИСЬ НА ТО, ЧТО ЛЭЙАТЫ БУДУТ РАЗНЫЕ
    }
    
    //MARK: - Setup
    
   private lazy var collectionView: UICollectionView = {
        
        let viewLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        
    
    collectionView.register(CellMyAlbums.self, forCellWithReuseIdentifier: "CellMyAlbums")
    collectionView.register(CellPeopleAndPlaces.self, forCellWithReuseIdentifier: "CellPeopleAndPlaces")
    
    collectionView.register(HeaderCellMyAlbums.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCellMyAlbums")
    
    collectionView.register(HeaderCellPeopleAndPlaces.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCellPeopleAndPlaces")
    
    collectionView.backgroundColor = .clear
    collectionView.delegate = self
    collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Альбомы"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTappedNavigationBar))
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    //MARK: - Actions
    
    @objc private func addTappedNavigationBar() {
        print("Press button NavigationBar: AddTapped")
    }
}

extension AlbumsViewController {
    
    //MARK: - Settings Sections
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            case 0: return self.layoutSectionCellAlbumsViewCell()
            case 1: return self.layoutSectionCellPeopleAndPlaces()
            default: return nil
            }
        }
    }
    
    private func layoutSectionCellAlbumsViewCell() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(50))

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,elementKind: "HeaderCellMyAlbums",
            alignment: .top)

        sectionHeader.pinToVisibleBounds = true
        sectionHeader.zIndex = Int.max
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(UIScreen.main.bounds.width * 0.5),
            heightDimension: .absolute(UIScreen.main.bounds.width))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count:2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                      leading: 0,
                                                      bottom: 60,
                                                      trailing: 0)
        group.interItemSpacing = .fixed(60)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    ///////////////////
    private func layoutSectionCellPeopleAndPlaces() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(50))

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,elementKind: "HeaderCellPeopleAndPlaces",
            alignment: .top)

        sectionHeader.pinToVisibleBounds = true
        sectionHeader.zIndex = Int.max
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(UIScreen.main.bounds.width * 0.5),
            heightDimension: .absolute(UIScreen.main.bounds.width))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count:1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                      leading: 0,
                                                      bottom: 250,
                                                      trailing: 0)
        group.interItemSpacing = .fixed(60)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
}

// MARK: - UICollectionViewDelegate & Data Source

extension AlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data["Section\(section)"]?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let data = data["Section\(indexPath.section)"]?[indexPath.row] else { return UICollectionViewCell() }
        
        switch data.type {
        case .cellMyAlbums:
            return setupCellMyAlbums(for: indexPath, with: data)
        case .cellPeopleAndPlaces:
            return setupCellPeopleAndPlaces(for: indexPath, with: data)
        case .cellTypesOfMedia:
            return setupCellMyAlbums(for: indexPath, with: data)
        }
    }
    
    private  func setupCellMyAlbums(for indexPath: IndexPath, with data: ModelCellMyAlbums) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMyAlbums", for: indexPath) as? CellMyAlbums else { return UICollectionViewCell() }
        
        cell.titleLabel.text = data.titleLabel
        cell.titleImage = data.titleImage
        cell.titleCount.text = data.titleCount
        return cell
    }
    
    private  func setupCellPeopleAndPlaces(for indexPath: IndexPath, with data: ModelCellMyAlbums) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellPeopleAndPlaces", for: indexPath) as? CellPeopleAndPlaces else { return UICollectionViewCell() }
        
        cell.titleLabel.text = data.titleLabel
        cell.titleImage = data.titleImage
        cell.titleCount.text = data.titleCount
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headerCellMyAlbums =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCellMyAlbums", for: indexPath) as! HeaderCellMyAlbums
        
        let headerCellPeopleAndPlaces =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCellPeopleAndPlaces", for: indexPath) as! HeaderCellPeopleAndPlaces
        
        guard  let data = data["Section\(indexPath.section)"]?[indexPath.row] else { return UICollectionViewCell() }
        
        switch data.type {
        case .cellMyAlbums:
            headerCellMyAlbums.configure()
            return headerCellMyAlbums
        case .cellPeopleAndPlaces:
            headerCellPeopleAndPlaces.configure()
            return headerCellPeopleAndPlaces
        case .cellTypesOfMedia:
            return headerCellPeopleAndPlaces
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Press cell: \(String(describing: data["Section\(indexPath.section)"]?[indexPath.row].titleLabel))")
    }
}
