//
//  MovieDetailsView.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import UIKit

class MovieDetailsView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    lazy var tableView = UITableView()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 2, height: 1)
        label.textColor = .white
        return label
    }()
    
    lazy var backdropImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "PlaceholderW300")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
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
    private func setupView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(snp_topMargin)
            make.leading.trailing.equalToSuperview()
            let height = (UIDevice.current.orientation == .portrait) ? 250 : 0
            make.height.equalTo(height)
        }
        
        containerView.addSubview(backdropImageView)
        backdropImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().offset(20)
        }
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp_bottomMargin).offset(20)
            if #available(iOS 11, *) {
                make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
            } else {
                make.leading.trailing.bottom.equalToSuperview()
            }
        }
    }
    
    func updateConstraints(for orientation: UIDeviceOrientation) {
        containerView.snp.updateConstraints { make in
            let height = (orientation == .portrait) ? 250 : 0
            make.height.equalTo(height)
        }
    }
}
