//
//  ReposListViewController.swift
//  ReposFetcher
//
//  Created by Dominik Buraczewski on 04/11/2021.
//

import UIKit

protocol ReposListViewControllerDelegate: AnyObject {
    func didChooseRepo(_ repoLink: URL?)
}

final class ReposListViewController: UIViewController {
    
    // MARK: Sections
    
    enum Section {
        case main
    }
    
    // MARK: Properties
    
    weak var delegate: ReposListViewControllerDelegate?
    
    var viewModel: ReposListViewModel!
    
    // MARK: Datasource
    
    private lazy var dataSource = UITableViewDiffableDataSource<Section, Repo>(tableView: reposTableView) { tableView, indexPath, repo in
        let repoCell = tableView.dequeueReusableCell(withIdentifier: RepoCell.identifier, for: indexPath) as? RepoCell
        let repoCellViewModel = RepoCellViewModel(repo: repo)
        repoCell?.viewModel = repoCellViewModel
        repoCell?.setUpContent()
        return repoCell
    }
    
    // MARK: UI
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Localizable.ReposList.searchTextFieldPlaceholder
        textField.addTarget(self, action: #selector(textFieldValueChanged), for: .editingChanged)
        return textField
    }()
    
    private lazy var reposTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RepoCell.self, forCellReuseIdentifier: RepoCell.identifier)
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        
        reposTableView.dataSource = dataSource

        view.addSubview(searchTextField)
        view.addSubview (reposTableView)

        searchTextField.addConstraints { [
            $0.equal(.safeAreaTop),
            $0.equal(.leading, constant: Margins.medium),
            $0.equal(.trailing, constant: -Margins.medium),
            $0.equalConstant(.height, 40)
        ] }
        
        reposTableView.addConstraints { [
            $0.equalTo(searchTextField, .top, .bottom),
            $0.equal(.leading),
            $0.equal(.trailing),
            $0.equal(.bottom)
        ] }
    }
    
    // MARK: Action
    
    @objc private func textFieldValueChanged(sender: UITextField) {
        viewModel.getRepos(for: sender.text) { [weak self] repos, error in
            DispatchQueue.main.async {
                self?.applySnapshot(for: repos)
            }
        }
    }
    
    private func applySnapshot(for repos: [Repo], animated: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Repo>()
        snapshot.appendSections([.main])
        snapshot.appendItems(repos)
        dataSource.apply(snapshot, animatingDifferences: animated, completion: nil)
    }
}

// MARK: UITableViewDelegate methods

extension ReposListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didChooseRepo(viewModel.getRepoURL(at: indexPath.row))
    }
}
