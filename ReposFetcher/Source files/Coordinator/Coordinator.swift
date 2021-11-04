//
//  Coordinator.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import Foundation

protocol Coordinator: AnyObject {
    
    /// Method triggered when new coordinator starts its life.
    func start()
}
