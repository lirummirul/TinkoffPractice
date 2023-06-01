//
//  CharacterCell.swift
//  Meditation
//
//  Created by Лада on 31.05.2023.
//

import UIKit
import SnapKit

final class CharacterCell: UITableViewCell {
    // UI
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    private lazy var nameLabel = UILabel()
    private lazy var artistName = UILabel()
    private lazy var audio = UILabel()
    private lazy var labelsStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameLabel, artistName])
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [logoImageView, labelsStackView])
        view.axis = .horizontal
        view.spacing = 16
        return view
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(contentStackView)
        contentStackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        logoImageView.image = UIImage(named: "logo2")
        nameLabel.text = nil
        artistName.text = nil
        audio.text = nil
    }
}

// MARK: - Configuration

extension CharacterCell {
    struct Model {
        let imageUrl: String
        let name: String
        let artistName: String
        let audio: String
        
        enum CodingKeys: String, CodingKey {
            case imageUrl
            case name
            case artistName = "artist_name"
            case audio
        }
    }
    
    func configure(with model: Model) {
        logoImageView.downloadImage(from: model.imageUrl)
        nameLabel.text = model.name
        artistName.text = model.artistName
        audio.text = model.audio
    }
}
