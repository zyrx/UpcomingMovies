//
//  ListsEndpoint.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

enum ListsEndpoint: MovieDatabaseApiEndpoint {
    // Get the details of a list.
    // @link: https://developers.themoviedb.org/3/lists/get-list-details
    case details
    // You can use this method to check if a movie has already been added to the list.
    // @link: https://developers.themoviedb.org/3/lists/check-item-status
    case itemStatus
    // Create a list.
    // @link: https://developers.themoviedb.org/3/lists/create-list
    case createList
    // Add a movie to a list.
    // @link: https://developers.themoviedb.org/3/lists/add-movie
    case addMovie
    // Remove a movie from a list.
    // @link: https://developers.themoviedb.org/3/lists/remove-movie
    case removeMovie
    // Clear all of the items from a list.
    // @link: https://developers.themoviedb.org/3/lists/clear-list
    case clearList
    // Delete a list.
    // @link: https://developers.themoviedb.org/3/lists/delete-list
    case deleteList

    var path: String {
        switch self {
        case .details:      return "/list/{list_id}"
        case .itemStatus:   return "/list/{list_id}/item_status"
        case .createList:   return "/list"
        case .addMovie:     return "/list/{list_id}/add_item"
        case .removeMovie:  return "/list/{list_id}/remove_item"
        case .clearList:    return "/list/{list_id}/clear"
        case .deleteList:   return "/list/{list_id}"
        }   
    }
    
    public var method: HTTPMethod {
        switch self {
        case .details,
             .itemStatus:
            return .get
            
        case .createList,
             .addMovie,
             .removeMovie,
             .clearList:
            return .post
            
        case .deleteList:
            return .delete
        }
    }
}
