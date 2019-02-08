//
//  RootViewModel.swift
//  UpcomingMovies
//
//  Created by Lech H. Conde on 08/02/2019.
//  Copyright © 2019 Lech H. Conde. All rights reserved.
//

import Foundation

protocol ConfigurationViewable {
    var configuration: Box<Configuration?> { get }
    func getConfiguration()
}

class ConfigurationViewModel: ConfigurationViewable {
    
    public var configuration: Box<Configuration?> = Box(nil)
    private let configurationService: ConfigurationService
    private let userDefaults: UserDefaults
    
    // MARK: - Initialization
    init(configurationService: ConfigurationService,
         userDefaults: UserDefaults) {
        self.configurationService = configurationService
        self.userDefaults = userDefaults
    }
    
    convenience init() {
        self.init(configurationService: ConfigurationService(endpoint: ConfigurationEndpoint.apiConfiguration),
                  userDefaults: UserDefaults.standard)
    }
    
    func getConfiguration() {
        guard let configurationDictionary = userDefaults.object(forKey: ConfigurationResponse.identifier) as? [String: Any],
        let configuration = Configuration.get(from: configurationDictionary) else {
            return getData(from: configurationService)
        }
        didReceiveData(configuration)
    }
}

// MARK: - MoviesServiceHandler
extension ConfigurationViewModel: ConfigurationServiceHandler {
    func didReceiveData(_ data: ConfigurationResponse) {
        configuration.value = data
        if let dictionary = data.dictionary {
            userDefaults.set(dictionary, forKey: ConfigurationResponse.identifier)
        }
    }
}
