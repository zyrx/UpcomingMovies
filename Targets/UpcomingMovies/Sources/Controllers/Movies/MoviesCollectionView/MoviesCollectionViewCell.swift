//
//  MoviesCollectionViewCell.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 07/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit
import SnapKit
import Kingfisher

class MoviesCollectionViewCell: UICollectionViewCell {
    typealias MoviesCollectionViewCellImage = (size: Images.Size, url: String)
    
    public var model: Movie?
    public var image: MoviesCollectionViewCellImage?
    public var informationContainerHeight: CGFloat = 44
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var genresLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, releaseDateLabel, genresLabel])
        stackView.alignment = .center
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Initialization
    public convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    public func updateWith(model: Movie, image: MoviesCollectionViewCellImage) {
        let placeholder = UpcomingMoviesAsset.placeholderW300.image
        if let posterPath = model.posterPath,
            let url = URL(string: image.url + image.size.name + posterPath) {
            imageView.kf.setImage(with: url, placeholder: placeholder)
        } else {
            imageView.image = placeholder
        }
        titleLabel.text = model.title
        releaseDateLabel.text = "[\(model.releaseDate)]"
        genresLabel.text = ""
        
        self.model = model
        self.image = image
    }
    
    private func setupView() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(informationContainerHeight)
        }
    }
}
