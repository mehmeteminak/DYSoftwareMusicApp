//
//  SearchBarExtensions.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 6.03.2023.
//

import Foundation
import UIKit

//This extension consist of operations about search box which is in the SearchVC
extension SearchVC : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        viewModel!.searchTextDidChange(searchText : searchText)
        
    }
}
