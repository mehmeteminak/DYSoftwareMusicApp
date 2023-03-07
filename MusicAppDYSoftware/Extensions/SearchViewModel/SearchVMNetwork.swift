//
//  SearchVMNetwork.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 8.03.2023.
//

import Foundation

//This view model extension is consist of network operations such as create request etc.

extension SearchViewModel {
    
    func createRequest(type : ContentTypes = .song , offset : Int = 1) -> NSMutableURLRequest {

        let urlString = "\(baseUrl)?term=general&offset=\(offset)&entity=\(type.rawValue)&limit=20"
        let url = URL(string: urlString)
        let request = NSMutableURLRequest(url: url!)
        return request
    }
}

enum ContentTypes : String {
    case movie  = "movie"
    case podcast = "podcast"
    case eBook = "ebook"
    case song = "song"
}
