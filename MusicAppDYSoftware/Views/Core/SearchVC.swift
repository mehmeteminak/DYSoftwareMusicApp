//
//  ViewController.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 4.03.2023.
//

import UIKit
import JGProgressHUD

class SearchVC: UIViewController {

    var viewModel : SearchViewModel?
    
    
    var contentTable : UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 200, width: deviceWidth, height: deviceHeight - 200))
        return table
    }()
    
    var progress : JGProgressHUD = {
        let hud = JGProgressHUD(style: .light)
        hud.frame = CGRect(x: deviceWidth / 2 - 100, y: deviceHeight / 2 - 100, width: 100, height: 100)
        return hud
    }()
    
    var segmentedControl : UISegmentedControl = {
        let segCtrl = UISegmentedControl(items: ["Movies","Music","Ebook","Podcast"])
        segCtrl.frame = CGRect(x: 0, y: 150, width: deviceWidth, height: 40)
        return segCtrl
    }()
    
    var searchBox : UISearchBar = {
        let searchField = UISearchBar(frame: CGRect(x: 40, y: 80, width: Int(deviceWidth * 0.8), height: 30))
        searchField.layer.borderWidth = 0
        return searchField
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        viewModel = SearchViewModel(vc: self)
        
        view.addSubViews([contentTable,segmentedControl,searchBox])
        
        progress.show(in: view)
        viewModel!.configureTable()
        viewModel!.configureSearchBar()
        viewModel!.configureSegmentedControl()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: NSNotification.Name("datasFetched"), object: nil)
        
        
        let request = viewModel!.createRequest(type: .movie)
        
        viewModel!.fetchData(request: request as URLRequest, expectingType: MovieItem.self)
       
    }
}


