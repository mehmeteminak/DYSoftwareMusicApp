//
//  ModelProtocol.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 5.03.2023.
//

import Foundation


protocol Item : Decodable {
    var results : [ItemResult] { get set}
}

protocol ItemResult : Decodable {
    var description : String? { get set}
    var imageUrl : String? { get set}
    var itemName : String? { get set}
    var itemPrice : Double? { get set }
    var releaseDate : String?  { get set}
   
    
}

