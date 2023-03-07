//
//  SearchVMScroll.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 8.03.2023.
//

import Foundation
import UIKit

//This view model extension is consist of operations about search bar which is in the SearchVC

extension SearchViewModel {
    
    func didScroll(scrollView : UIScrollView) {
        
        let scrollPercentage = (scrollView.contentOffset.y + scrollView.frame.size.height) / scrollView.contentSize.height
            if scrollPercentage >= 0.8 {
                fetchDatas(removeOldDatas: false)
            }
    }
}
