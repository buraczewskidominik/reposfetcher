//
//  APIError.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import Foundation

enum APIError: Error {
    case malformedResponseJson
    case commonError
    case noData
}
