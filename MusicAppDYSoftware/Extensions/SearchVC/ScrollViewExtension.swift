//
//  ScrollViewExtension.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 6.03.2023.
//

import Foundation
import UIKit


extension SearchVC {
    // This function will request the api for more datas when the user has scrolled to 80% of table height
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        viewModel!.didScroll(scrollView : scrollView)
    }
    
}
