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
    func configureSearchBar(){
        searchBox.delegate = self
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKybrd))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func dismissKybrd(){
        view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count > 2 {
            filteredContentItems = contentItems.filter({ itemResult in
                
                return itemResult.itemName!.contains(searchText)
            })
            NotificationCenter.default.post(name: NSNotification.Name("datasFetched"), object: nil)
            
        }else {
            filteredContentItems = contentItems
            NotificationCenter.default.post(name: NSNotification.Name("datasFetched"), object: nil)
        }
    }
}
