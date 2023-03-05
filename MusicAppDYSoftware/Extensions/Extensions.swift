//
//  Extensions.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 4.03.2023.
//

import Foundation
import UIKit



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

extension UIView {
    func addSubViews(_ views : [UIView]){
        views.forEach { view in
            self.addSubview(view)
        }
    }
}



extension UIImage {
    static func fetchFromInternet(urlString : String , completionHandler : @escaping (UIImage?) -> Void){
        
        let session = URLSession.shared
        session.dataTask(with: URL(string: urlString)!) { data, _, error in
            if error != nil {
                print(error!.localizedDescription)
                completionHandler(nil)
                return
            }
            if let data = data  {
                let image = UIImage(data: data)
                completionHandler(image)
            }
        }.resume()
        
    }
}


