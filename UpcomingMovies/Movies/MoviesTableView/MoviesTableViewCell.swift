//
//  MoviesTableViewCell.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func updateWith(model: Movie) {
        self.textLabel?.text = model.title
        self.detailTextLabel?.text = model.overview
    }
}
