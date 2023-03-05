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
        let vc = DetailsVC()
        vc.itemResult = filteredContentItems[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func configureTable(){
        contentTable.delegate = self
        contentTable.dataSource = self
        contentTable.isUserInteractionEnabled = true
        let nib = UINib(nibName: "ItemCell", bundle: nil)
        contentTable.register(nib, forCellReuseIdentifier: "contentCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = contentTable.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath) as! ItemCell
        
        cell.isUserInteractionEnabled = true
        
        let date = filteredContentItems[indexPath.row].releaseDate?.split(separator: "-")
        
        UIImage.fetchFromInternet(urlString: filteredContentItems[indexPath.row].imageUrl!) { image in
            guard let _ = image else {
                cell.cellImage.image = UIImage(systemName: "x.circle.fill")
                return
            }
            DispatchQueue.main.async {
                cell.cellImage.image = image
            }
        }
        

        cell.cellTexts.text = "\(filteredContentItems[indexPath.row].itemName!) \n \(filteredContentItems[indexPath.row].itemPrice!) $ \n \(String(date![1]))/\(String(date![0]))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredContentItems.count
    }
    
    
}
