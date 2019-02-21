//
//  ServiceHandler.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 04/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//  GNU General Public License version 3 or later; see LICENSE or <https://www.gnu.org/licenses/>.
//

import Foundation

protocol ServiceHandler {
    associatedtype ResultType
    func didReceiveData(_ data: ResultType)
    func didFailWith(_ error: Error)
}

extension ServiceHandler {
    func didFailWith(_ error: Error) {
        var localizedDescription = error.localizedDescription
        if let error = error as? NetworkError {
            localizedDescription = error.localizedDescription
        }
        print("Network Error: \(localizedDescription)")
    }
}

extension ServiceHandler {
    public func getData<Service: Gettable>(from service: Service)
        where Service.DataType == ResultType {
        service.get() { result in
            switch result {
            case .success(let data):
                self.didReceiveData(data)
            case .failure(let error):
                self.didFailWith(error)
            }
        }
    }
}
