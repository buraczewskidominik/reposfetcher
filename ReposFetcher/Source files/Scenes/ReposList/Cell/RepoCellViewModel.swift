//
//  RepoCellViewModel.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import Foundation

final class RepoCellViewModel: NSObject {
    
    private let repo: Repo
    
    init(repo: Repo) {
        self.repo = repo
    }
    
    func getRepoName() -> String { repo.name }
}
