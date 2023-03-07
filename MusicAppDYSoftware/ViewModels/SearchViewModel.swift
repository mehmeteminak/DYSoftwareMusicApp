//
//  SearchViewModel.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 4.03.2023.
//

import Foundation
import UIKit



protocol SearchViewProtocol {
    var viewCtrl : SearchVC { get set }
}


class SearchViewModel : SearchViewProtocol {
    
    var offset : Int = 2

    var viewCtrl: SearchVC

    var contentItems : [ItemResult] = []
    var filteredContentItems : [ItemResult] = []
    
    init(vc : SearchVC){
        self.viewCtrl = vc
    }
    
    //Load more parameter is specified to the the user is wanting more data in same data category (like movie , podcast , etc.) or the user is requesting data first time
    func fetchData<T : Item>(request: URLRequest , expectingType : T.Type , loadMore : Bool = false){
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { data, _, error in
            if error != nil {
                
                DispatchQueue.main.async {
                    self.viewCtrl.presentAlert(errTitle: "Error!", errMsg: error!.localizedDescription)
                }
                
            }
            guard let data = data else {
                return
            }
            
            do {
                
                let fetchedDatas = try  JSONDecoder().decode(T.self, from: data)
                
                if loadMore {
                    
                    fetchedDatas.results.forEach { itemResult in
                        self.contentItems.append(itemResult)
                        self.filteredContentItems.append(itemResult)
                    }
                    
                } else  {
                    self.contentItems = fetchedDatas.results
                    self.filteredContentItems = fetchedDatas.results
                    
                }
                
                NotificationCenter.default.post(name: NSNotification.Name("datasFetched"), object: nil)
                
            }
            catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
        
    }
    // This function will be execute from SearchVC when the datas are fetched
    func updateUI(){
        
            DispatchQueue.main.async {
                self.viewCtrl.progress.dismiss(animated: true)
                self.viewCtrl.contentTable.reloadData()
            }
    }
}



