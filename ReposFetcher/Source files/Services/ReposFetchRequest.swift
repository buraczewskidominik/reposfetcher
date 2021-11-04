//
//  ReposFetchRequest.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import Foundation

struct ReposFetchRequest: Request {
    
    // MARK: Properties

    // - SeeAlso: Request.path
    var path: String {
        "/search/repositories"
    }

    // - SeeAlso: Request.method
    var method: HTTPMethod {
        .get
    }
    
    // - SeeAlso: Request.parameters
    var parameters: [String: String]? {
        [
            "q": keyword,
            "page": page
        ]
    }

    // - SeeAlso: Request.headers
    var headers: [String: String]? {
        [
            "Accept": "application/vnd.github.v3+json",
            "Content-Type": "application/json"
        ]
    }
    
    // MARK: Private properties

    private let keyword: String
    private let page: String

    // MARK: Initializers

    /// Initializes the receiver.
    /// - Parameters:
    ///   - keyword: The keyword to look for.
    ///   - page: The page to fetch.
    init(
        keyword: String,
        page: String? = nil
    ) {
        self.keyword = keyword
        self.page = page ?? "1"
    }
}
