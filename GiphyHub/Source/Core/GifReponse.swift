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

class GiphyResponse: StaticMappable {
    
    var httpResponseCode: UInt?
    var message: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        httpResponseCode <- map["meta.status"]
        message <- map["meta.msg"]
    }
    
    class func objectForMapping(map: Map) -> BaseMappable? {
        
        if let _:[String: AnyObject]? = map["pagination"].value() {
            
            return GifsResponse(map: map)
            
        } else {
            
            return GifResponse(map: map)
        }
    }
}

class GifsResponse: GiphyResponse {
    
    var gifs:[Gif]?
    var pagination: GifPagination?
    
    required init?(map: Map) {
        
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        
        super.mapping(map: map)
        
        pagination <- map["pagination"]
        gifs <- map["data"]
    }
}

class GifResponse: GiphyResponse {
    
    var gif:Gif?
    
    required init?(map: Map) {
        
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        
        super.mapping(map: map)
        gif <- map["data"]
    }
}
