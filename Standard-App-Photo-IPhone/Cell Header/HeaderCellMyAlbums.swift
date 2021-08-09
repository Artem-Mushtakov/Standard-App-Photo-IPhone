import UIKit

class HeaderCellMyAlbums: UICollectionReusableView {
    
    // MARK: - Properties
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Мои альбомы"
        label.textColor  = .white
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("См. все", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    } ()
    
    // MARK: - Actions
    
    @objc private func buttonAction() {
        print("Press button: См. все")
    }
    
    // MARK: - Setup Layout
    
    public func configure() {
        addSubview(label)
        addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            
            button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            button.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -10)
        ])
    }
}
