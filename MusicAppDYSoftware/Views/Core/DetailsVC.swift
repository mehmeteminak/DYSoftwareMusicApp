//
//  DetailsVC.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 5.03.2023.
//

import UIKit
import JGProgressHUD


class DetailsVC: UIViewController {

    var itemResult : ItemResult!
    
    private var progress : JGProgressHUD = {
        let hud = JGProgressHUD(style: .light)
        hud.frame = CGRect(x: 100, y: 90, width: deviceWidth * 0.3, height: deviceHeight * 0.2)
        return hud
    }()
    
    private var imageView : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 30, y: 150, width: deviceWidth * 0.8, height: deviceWidth * 0.2))
        image.contentMode = .scaleAspectFit
        return image
    }()
    private var texts : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: deviceHeight * 0.5, width: deviceWidth, height: deviceHeight * 0.5))
        label.numberOfLines = 12
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubViews([imageView,texts])
        
        progress.show(in: imageView)
        
        UIImage.fetchFromInternet(urlString: itemResult.imageUrl!) { image in
            
            
            DispatchQueue.main.async {
                self.progress.dismiss(animated: true)
                self.imageView.image = image
            }
        }
        setTexts()
        
    }
    
    func setTexts() {
        let date = itemResult.releaseDate?.split(separator: "-")
        texts.text = "\(itemResult.itemName!) \n \(itemResult.itemPrice!) $ \n \(String(date![1]))/\(String(date![0]))\n \(itemResult.description!)"
    }
    
}
