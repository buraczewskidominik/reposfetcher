//
//  ReposFetchService.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import Foundation

protocol ReposFetchService: AnyObject {
    func fetchRepos(
        keyword: String?,
        page: String?,
        completionHandler: @escaping (Result<Repos, Error>) -> Void
    )
}

final class DefaultReposFetchService: ReposFetchService {
    
    // MARK: Private properties

    private let apiClient: APIClient
    
    // MARK: Initializers

    /// Initializes the receiver.
    /// - Parameters:
    ///   - apiClient: Client which allows connecting to the API.
    init(
        apiClient: APIClient
    ) {
        self.apiClient = apiClient
    }
    
    func fetchRepos(
        keyword: String?,
        page: String?,
        completionHandler: @escaping (Result<Repos, Error>) -> Void) {
        guard let keyword = keyword else {
            completionHandler(.failure(APIError.noData))
            return
        }
        let reposFetchRequest = ReposFetchRequest(
            keyword: keyword,
            page: page
        )
        apiClient.execute(
            request: reposFetchRequest,
            answerType: Repos.self
        ) { result in
            completionHandler(result)
        }
    }
}
