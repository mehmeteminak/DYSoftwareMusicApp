//
//  SearchVCExtensions.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 5.03.2023.
//

import Foundation
import UIKit

//This extension consist of operations about segmented control which is in the SearchVC
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


