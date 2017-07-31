//
//  GifImage.swift
//  GiphyHub
//
//  Created by Mohamed Aymen Landolsi on 27/07/2017.
//  Copyright © 2017 Roridi. All rights reserved.
//

import Foundation
import ObjectMapper

public class GifImage: Mappable {
    
    public var width: Int?
    public var height: Int?
    public var url: URL?
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        
        width <- (map["width"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        height <- (map["height"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        url <- (map["url"], URLTransform())
    }
}

public class GifFixed: GifImage {
    
    public var size: Int?
    public var mp4URL: URL?
    public var mp4Size: Int?
    public var webpURL: URL?
    public var webpSize: Int?
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        size <- (map["size"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        mp4URL <- (map["mp4"], URLTransform())
        mp4Size <- (map["mp4_size"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        webpURL <- (map["webp"], URLTransform())
        webpSize <- (map["webp_size"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
    }
}

public class GifDownsampled: GifImage {
    
    public var size: Int?
    public var webpURL: URL?
    public var webpSize: Int?
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        size <- (map["size"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        webpURL <- (map["webp"], URLTransform())
        webpSize <- (map["webp_size"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
    }
}

public class GifDownsized: GifImage {
    
    public var size: Int?
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        size <- (map["size"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
    }
}

public class GifOriginal: GifImage {
    
    public var size: Int?
    public var frames: Int?
    public var mp4URL: URL?
    public var mp4Size: Int?
    public var webpURL: URL?
    public var webpSize: Int?
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        size <- (map["size"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        frames <- (map["frames"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        mp4URL <- (map["mp4"], URLTransform())
        mp4Size <- (map["mp4_size"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        webpURL <- (map["webp"], URLTransform())
        webpSize <- (map["webp_size"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
    }
}

public class GifSmall: GifImage {
    
    public var size: Int?
    public var webpURL: URL?
    public var webpSize: Int?
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        size <- (map["size"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        webpURL <- (map["webp"], URLTransform())
        webpSize <- (map["webp_size"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
    }
}
