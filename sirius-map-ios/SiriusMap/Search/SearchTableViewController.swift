//
//  SearchTableViewController.swift
//  SiriusMap
//
//  Created by Egor on 21.03.2024.
//

import UIKit

private extension String {
    static let reuseIdentifier = "reuse-identifier"
}

protocol SearchTableViewControllerDelegate: AnyObject {
    func searchTableViewController(didSelectRowAt indexPath: IndexPath)
    func resize()
}

final class SearchTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    weak var delegate: SearchTableViewControllerDelegate?
    
    private let items: [String]
    private var filteredItems: [String] = [] {
        didSet {
            tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }
    
    // MARK: - Initializers
    
    init(items: [String]) {
        self.items = items
        super.init(style: .plain)
        filteredItems = items
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: .reuseIdentifier)
    }
    
    // MARK: - Methods
    
    func updateTable(for searchString: String) {
        filteredItems = items.filter { item -> Bool in
            item.localizedCaseInsensitiveContains(searchString)
        }
    }
    
    func resetTable() {
        filteredItems = items
    }
    
    private func setupSearchController() {
        let searchController = UISearchController()
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: .reuseIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = filteredItems[indexPath.row]
        
        cell.contentConfiguration = content
        return cell
    }
    
    
    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.searchTableViewController(didSelectRowAt: indexPath)
    }
}
