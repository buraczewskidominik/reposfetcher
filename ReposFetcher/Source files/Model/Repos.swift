//
//  Repos.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import Foundation

struct Repos {
    let repos: [Repo]
    
    enum CodingKeys: String, CodingKey {
        case repos = "items"
    }
}

extension Repos: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        repos = try container.decode(Array<Repo>.self, forKey: .repos)
    }
}
