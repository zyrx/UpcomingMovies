//
//  GenresParams.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 06/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

struct GenresParams: Encodable {
    /// Pass a ISO 639-1 value to display translated
    /// data for the fields that support it; default: en-US.
    var language: String?
}
