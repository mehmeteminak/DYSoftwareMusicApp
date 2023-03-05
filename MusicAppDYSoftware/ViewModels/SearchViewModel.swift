//
//  SearchViewModel.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 4.03.2023.
//

import Foundation
import UIKit



protocol SearchViewProtocol {
    var viewController : SearchVC { get set }
}


struct SearchViewModel : SearchViewProtocol {
    var viewController: SearchVC

    
    init(vc : SearchVC){
        self.viewController = vc
    }
    
    func fetchData<T : Codable>(request: URLRequest , expectingType : T.Type){
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { data, _, error in
            if error != nil {
                
                DispatchQueue.main.async {
                    self.viewController.presentAlert(errTitle: "Error!", errMsg: error!.localizedDescription)
                }
                
            }
            guard let data = data else {
                return
            }
            
            do {
                print(String(data: data, encoding: .utf8))
               
                let fetchedDatas = try  JSONDecoder().decode(T.self, from: data)
                if T.self is Items.Type {
                    self.viewController.contentItems = (fetchedDatas as! Items).results
                }
                NotificationCenter.default.post(name: NSNotification.Name("datasFetched"), object: nil)
                
            }
            catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
        
    }
    
    func updateUI(){
        
            DispatchQueue.main.async {
                viewController.contentTable.reloadData()
            }
    }
}
