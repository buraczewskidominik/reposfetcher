//
//  AppDependencies.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import Foundation

/// A holder for dependencies used in the app.
final class AppDependencies {
    
    // MARK: Network
    
    lazy var apiClient = DefaultAPIClient()
    
    // MARK: Service
    
    /// Service providing user communication with the server.
    lazy var repoFetchService = DefaultReposFetchService(apiClient: apiClient)
}
