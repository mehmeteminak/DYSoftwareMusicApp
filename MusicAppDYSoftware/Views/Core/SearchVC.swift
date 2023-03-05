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
    var contentItems : [Result] = []
    var filteredContentItems : [Result] = []
    
    
    var contentTable : UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 200, width: deviceWidth, height: deviceHeight - 200))
        return table
    }()
    
    var segmentedControl : UISegmentedControl = {
        let segCtrl = UISegmentedControl(items: ["Movies","Music","Ebook","Podcast"])
        segCtrl.frame = CGRect(x: 0, y: 150, width: deviceWidth, height: 40)
        return segCtrl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel = SearchViewModel(vc: self)
        view.addSubViews([contentTable,segmentedControl])
       
        configureTable()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: NSNotification.Name("datasFetched"), object: nil)
        
        //
        let request = NSMutableURLRequest(url: URL(string: baseUrl)! , cachePolicy: .useProtocolCachePolicy , timeoutInterval: 10.0)
        
        //
        viewModel?.fetchData(request: request as URLRequest , expectingType: Items.self)
        
    }
}


