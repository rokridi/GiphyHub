//
//  Gif.swift
//  GiphyHub
//
//  Created by Mohamed Aymen Landolsi on 27/07/2017.
//  Copyright © 2017 Roridi. All rights reserved.
//

import Foundation
import ObjectMapper

public class Gif: Mappable {
    
    public enum GifType: String {
    
        case gif = "gif"
    }
    
    public enum GifRating: String {
        
        case Y = "y"
        case G = "g"
        case PG = "pg"
        case PG13 = "pg-13"
        case R = "r"
    }
    
    var type: GifType?
    public var identifier: String?
    public var slug: String?
    public var url: URL?
    public var bitlyGifURL: URL?
    public var bitlyURL: URL?
    public var embedURL: URL?
    public var userName: String?
    public var source: URL?
    public var rating: GifRating?
    public var caption: String?
    public var contentURL: URL?
    public var sourceTLD: String?
    public var sourcePostURL: URL?
    public var importDateTime: Date?
    public var trendingTime: Date?
    public var fixedHeightImage: GifFixed?
    public var fixedHeightStillImage: GifImage?
    public var fixedHeightDownsampledImage: GifDownsampled?
    public var fixedWidthImage: GifFixed?
    public var fixedWidthStillImage: GifImage?
    public var fixedWidthDownsampledImage: GifDownsampled?
    public var fixedHeightSmallImage: GifSmall?
    public var fixedHeightSmallStillImage: GifImage?
    public var fixedWidthSmallImage: GifSmall?
    public var fixedWidthSmallStillImage: GifImage?
    public var downsizedImage: GifDownsized?
    public var downsizedStillImage: GifImage?
    public var downsizedLargeImage: GifDownsized?
    public var originalImage: GifOriginal?
    public var originalStillImage: GifImage?
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        
        type <- (map["type"], EnumTransform<GifType>())
        identifier <- map["id"]
        slug <- map["slug"]
        url <- (map["url"], URLTransform())
        bitlyGifURL <- (map["bitly_gif_url"], URLTransform())
        bitlyURL <- (map["bitly_url"], URLTransform())
        embedURL <- (map["embed_url"], URLTransform())
        userName <- map["username"]
        source <- (map["source"], URLTransform())
        rating <- (map["rating"], EnumTransform<GifRating>())
        caption <- map["caption"]
        contentURL <- (map["content_url"], URLTransform())
        sourceTLD <- map["source_tld"]
        sourcePostURL <- (map["source_post_url"], URLTransform())
        importDateTime <- (map["import_datetime"], DateTransform())
        trendingTime <- (map["trending_datetime"], DateTransform())
        fixedHeightImage <- map["images.fixed_height"]
        fixedHeightStillImage <- map["images.fixed_height_still"]
        fixedHeightDownsampledImage <- map["images.fixed_height_downsampled"]
        fixedWidthImage <- map["images.fixed_width"]
        fixedWidthStillImage <- map["images.fixed_width_still"]
        fixedWidthDownsampledImage <- map["images.fixed_width_downsampled"]
        fixedHeightSmallImage <- map["images.fixed_height_small"]
        fixedHeightSmallStillImage <- map["images.fixed_height_small_still"]
        fixedWidthSmallImage <- map["images.fixed_width_small"]
        fixedWidthSmallStillImage <- map["images.fixed_width_small_still"]
        downsizedImage <- map["images.downsized"]
        downsizedStillImage <- map["images.downsized_still"]
        downsizedLargeImage <- map["images.downsized_large"]
        originalImage <- map["images.original"]
        originalStillImage <- map["images.original_still"]
    }
}
