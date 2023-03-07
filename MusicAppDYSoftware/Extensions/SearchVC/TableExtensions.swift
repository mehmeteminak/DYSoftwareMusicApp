//
//  TableExtensions.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 6.03.2023.
//


import Foundation
import UIKit

// This extension consist of operations about TableViewController
extension SearchVC : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return deviceHeight * 0.2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel!.didSelectRow(indexPath : indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return viewModel!.cellForRow(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.numberOfRows()
    }
    
    
}
