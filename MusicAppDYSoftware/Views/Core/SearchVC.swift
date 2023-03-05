//
//  ViewController.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 4.03.2023.
//

import UIKit

class SearchVC: UIViewController {

    var isFiltered : Bool = false
    var viewModel : SearchViewModel?
    var offset : Int = 2
    var contentItems : [ItemResult] = []
    var filteredContentItems : [ItemResult] = []
    
    
    var contentTable : UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 200, width: deviceWidth, height: deviceHeight - 200))
        return table
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
        configureTable()
        configureSearchBar()
        configureSegmentedControl()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: NSNotification.Name("datasFetched"), object: nil)
        
        
        let request = createRequest(type: .movie)
        
        viewModel?.fetchData(request: request as URLRequest, expectingType: MovieItem.self)
       
    }
}


