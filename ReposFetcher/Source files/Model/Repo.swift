//
//  Repo.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import Foundation

struct Repo: Hashable {
    let id: Int
    let name: String
    let destination: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case destination = "html_url"
    }
}

extension Repo: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        destination = try container.decode(String.self, forKey: .destination)
    }
}
