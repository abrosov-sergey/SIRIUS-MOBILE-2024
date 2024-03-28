//
//  SearchTableViewController+Updating.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import UIKit

extension SearchTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchString = searchController.searchBar.text,
           !searchString.isEmpty
        {
            updateTable(for: searchString)
        } else {
            resetTable()
        }
    }
}
