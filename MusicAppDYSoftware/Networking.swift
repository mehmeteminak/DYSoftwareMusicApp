//
//  Networking.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 5.03.2023.
//

import Foundation

enum ContentTypes : String {
    case movie  = "movie"
    case podcast = "podcast"
    case eBook = "ebook"
    case song = "song"
}


extension SearchVC {
    func createRequest(type : ContentTypes = .song , offset : Int = 1) -> NSMutableURLRequest {

        let urlString = "\(baseUrl)?term=general&offset=\(offset)&entity=\(type.rawValue)&limit=20"
        let url = URL(string: urlString)
        let request = NSMutableURLRequest(url: url!)
        return request
    }
}
