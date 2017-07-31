//
//  GifReponse.swift
//  GiphyHub
//
//  Created by Mohamed Aymen Landolsi on 27/07/2017.
//  Copyright © 2017 Roridi. All rights reserved.
//

import Foundation
import ObjectMapper

public struct GifPagination: Mappable {
    
    var totalCount: Int?
    var count: Int?
    var offset: Int?
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        totalCount 	<- map["total_count"]
        count 	<- map["count"]
        offset <- map["offset"]
    }
}

class GifReponse: Mappable {
    
    var gifs:[Gif]?
    var httpResponseCode: UInt?
    var pagination: GifPagination?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        gifs <- map["data"]
        httpResponseCode <- map["meta.status"]
        pagination <- map["pagination"]
    }
    
}
