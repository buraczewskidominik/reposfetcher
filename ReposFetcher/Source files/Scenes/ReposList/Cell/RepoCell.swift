//
//  RepoCell.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import UIKit

final class RepoCell: UITableViewCell {
    
    // MARK: Properties
    
    static let identifier = "RepoCell"
    
    var viewModel: RepoCellViewModel!
    
    // MARK: Private properties
    
    private lazy var repoNameLabel: UILabel = {
        UILabel()
    }()
    
    // MARK: Init

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        repoNameLabel.text = nil
    }
    
    override func setSelected(
        _ selected: Bool,
        animated: Bool
    ) {
        super.setSelected(
            false,
            animated: false
        )
    }
    
    private func setUpUI() {
        contentView.addSubview(repoNameLabel)
        
        repoNameLabel.addConstraints { [
            $0.equal(.top, constant: Margins.tiny),
            $0.equal(.bottom, constant: -Margins.tiny),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium)
        ] }
    }

    func setUpContent() {
        repoNameLabel.text = viewModel.getRepoName()
    }
}
