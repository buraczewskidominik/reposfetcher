//
//  URLRequestConvertible.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import Foundation

/// Describes an entity capable of being converted into url request.
protocol URLRequestConvertible {
    /// Returns the entity converted into url request.
    func asURLRequest() -> URLRequest
}
