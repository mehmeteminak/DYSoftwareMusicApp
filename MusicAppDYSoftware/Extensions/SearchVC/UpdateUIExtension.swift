//
//  UpdateUIExtension.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 6.03.2023.
//

import Foundation

extension SearchVC {
    // This function will be executed by SearchVC when the datas are fetched
    @objc func updateUI(){
        self.viewModel!.updateUI()
    }
}
