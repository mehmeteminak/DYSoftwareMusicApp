//
//  SearchVCExtensions.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 5.03.2023.
//

import Foundation
import UIKit

// This extension consist of operations about TableViewController
extension SearchVC : UITableViewDelegate , UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return deviceHeight * 0.2
    }
    
    
    func configureTable(){
       
        contentTable.delegate = self
        contentTable.dataSource = self
        let nib = UINib(nibName: "ItemCell", bundle: nil)
        contentTable.register(nib, forCellReuseIdentifier: "contentCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = contentTable.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath) as! ItemCell
        
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

extension SearchVC {
    // This function will be executed by SearchVC when the datas are fetched
    @objc func updateUI(){
        self.viewModel!.updateUI()
    }
}


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

extension SearchVC {
    func configureSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0

    }
    
    func fetchDatas(removeOldDatas : Bool = true){
        switch segmentedControl.selectedSegmentIndex {
        case 0 :
            let request = createRequest(type: .movie , offset: offset)
            
            if removeOldDatas {
                contentItems.removeAll()
                
            } else {
                offset += 1
                
            }
      
            viewModel?.fetchData(request: request as URLRequest, expectingType: MovieItem.self , loadMore: !removeOldDatas)
        case 1 :
            let request = createRequest(type: .song , offset: offset)
            if removeOldDatas {
                contentItems.removeAll()
                
            }
            else {
                offset += 1
                
            }
            
            
            viewModel?.fetchData(request: request as URLRequest, expectingType: MusicItem.self ,loadMore: !removeOldDatas)
        case 2 :
            let request = createRequest(type: .eBook , offset: offset)
            
            if removeOldDatas {
                contentItems.removeAll()
                
            } else {
                offset += 1
                
            }
            
            viewModel?.fetchData(request: request as URLRequest, expectingType: EbookItem.self , loadMore: !removeOldDatas)
        case 3 :
            let request = createRequest(type: .podcast , offset: offset)
            if removeOldDatas {
                contentItems.removeAll()
                
            }else {
                offset += 1
            }

            viewModel?.fetchData(request: request as URLRequest, expectingType: PodcastItem.self ,loadMore: !removeOldDatas)
            
        default :
            presentAlert(errTitle: "ERROR!", errMsg: "An unknown error occured!")
        }
    }
    
    @objc func segmentChanged(){
        fetchDatas(removeOldDatas: true)
    }
}

extension SearchVC {
    // This function will request the api for more datas when the user has scrolled to 80% of table height
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPercentage = (scrollView.contentOffset.y + scrollView.frame.size.height) / scrollView.contentSize.height
            if scrollPercentage >= 0.8 {
                fetchDatas(removeOldDatas: false)
            }
    }
    
}
