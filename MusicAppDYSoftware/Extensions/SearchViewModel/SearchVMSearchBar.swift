//
//  SearchVMSearchBar.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 8.03.2023.
//

import Foundation
import UIKit

//This view model extension is consist of operations about search bar which is in the SearchVC

extension SearchViewModel {
    
    func configureSearchBar(){
        
        viewCtrl.searchBox.delegate = viewCtrl
        let gesture = UITapGestureRecognizer(target: viewCtrl, action: #selector(dismissKybrd))
        viewCtrl.view.addGestureRecognizer(gesture)
    }
    
    @objc func dismissKybrd(){
        viewCtrl.view.endEditing(true)
    }
    
    func searchTextDidChange(searchText : String){
        
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
