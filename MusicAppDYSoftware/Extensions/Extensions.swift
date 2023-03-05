//
//  Extensions.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 4.03.2023.
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
        cell.cellImage.image = UIImage(systemName: "person.circle")
        cell.cellTexts.text = "\(contentItems[indexPath.row].shortDescription) \n \(contentItems[indexPath.row].hasITunesExtras) \(contentItems[indexPath.row].longDescription)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentItems.count
    }
    
    
}


extension UIViewController {
    
    // This function is generating and presenting alert.
    func presentAlert(errTitle: String ,errMsg : String , type : UIAlertController.Style = .alert , okButton : Bool = true , otherActions : [UIAlertAction] = []){
        let alert = UIAlertController(title: errTitle, message: errMsg, preferredStyle: .alert)
        
        if okButton {
            let okBtn = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(okBtn)
        }
        if otherActions.count > 0 {
            otherActions.forEach { action in
                alert.addAction(action)
            }
        }
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
        
    }
}



extension SearchVC {
    // This function will be executed by SearchVC when the datas are fetched
    @objc func updateUI(){
        self.viewModel!.updateUI()
    }
}

extension UIView {
    func addSubViews(_ views : [UIView]){
        views.forEach { view in
            self.addSubview(view)
        }
    }
}


