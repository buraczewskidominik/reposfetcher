//
//  ReposListViewModel.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import Foundation

final class ReposListViewModel: NSObject {
    
    // MARK: Private properties
    
    private let reposFetchService: ReposFetchService
    private var fetchedRepos: [Repo]
    
    // MARK: Init
    
    init(
        reposFetchService: ReposFetchService
    ) {
        self.reposFetchService = reposFetchService
        fetchedRepos = []
    }
    
    func getRepos(
        for keyword: String?,
        completionHandler: @escaping ([Repo], Error?) -> Void
    ) {
        reposFetchService.fetchRepos(
            keyword: keyword,
            page: nil
        ) { [weak self] result in
            switch result {
            case .success(let repos):
                self?.fetchedRepos = repos.repos
                completionHandler(repos.repos, nil)
            case .failure(let error):
                completionHandler([], error)
            }
        }
    }
    
    func getRepoURL(at position: Int) -> URL? {
        URL(string: fetchedRepos[position].destination)
    }
}
