//
//  SearchVMTable.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 8.03.2023.
//

import Foundation
import UIKit

extension SearchViewModel {
    
    func didSelectRow(indexPath : IndexPath) {
        let vc = DetailsVC()
        vc.itemResult = filteredContentItems[indexPath.row]
        viewCtrl.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func configureTable(){
        
        viewCtrl.contentTable.delegate = viewCtrl
        viewCtrl.contentTable.dataSource = viewCtrl
        viewCtrl.contentTable.isUserInteractionEnabled = true
        let nib = UINib(nibName: "ItemCell", bundle: nil)
        viewCtrl.contentTable.register(nib, forCellReuseIdentifier: "contentCell")
        
    }
    
    
    func cellForRow(indexPath : IndexPath) -> UITableViewCell {
        let cell = viewCtrl.contentTable.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath) as! ItemCell
        
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
    
    
    func numberOfRows() -> Int{
        return filteredContentItems.count
    }
    
}


    
    
    
    
    
    
    
    
    
