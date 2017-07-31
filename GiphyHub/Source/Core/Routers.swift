//
//  Routers.swift
//  GiphyHub
//
//  Created by Mohamed Aymen Landolsi on 28/07/2017.
//  Copyright © 2017 Roridi. All rights reserved.
//

import Foundation
import Alamofire

enum GifsRouter: URLRequestConvertible {
    
    static let BaseURLString = "http://api.giphy.com/v1/"
    
    case search(query: String, limit: UInt?, offset: UInt?, rating: Gif.GifRating?, language: String?, apiKey: String)
    case trending(limit: UInt?, rating: Gif.GifRating?, apiKey: String)
    case translate(String, apiKey: String)
    case random(tag: String?, rating: Gif.GifRating?, apiKey:String)
    case gif(identifier: String, apiKey: String)
    case gifs(identifiers: [String], apiKey: String)
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .search(_, _, _, _, _, _):
            return "gifs/search"
        case .trending(_, _, _):
            return "gifs/trending"
        case .translate(_, _):
            return "gifs/translate"
        case .random(_, _, _):
            return "gifs/random"
        case .gif(let identifier, _):
            return "gifs/\(identifier)"
        case .gifs(_):
            return ("gifs")
        }
    }
    
    private var parameters: [String: AnyObject] {
        
        var parameters: [String: AnyObject] = [:]
        
        switch self {
        case let .search(keyWord, limit, offset, rating, language, apiKey):
            
            parameters["api_key"] = apiKey as AnyObject
            
            parameters["q"] = keyWord as AnyObject
            
            if let lim = limit {
                parameters["limit"] = lim as AnyObject
            }
            if let offset = offset {
                parameters["offset"] = offset as AnyObject
            }
            if let rating = rating {
                parameters["rating"] = rating.rawValue as AnyObject
            }
            if let language = language {
                parameters["lang"] = language as AnyObject
            }
            
        case let .trending(limit, rating, apiKey):
            
            parameters["api_key"] = apiKey as AnyObject
            
            if let lim = limit {
                parameters["limit"] = lim as AnyObject
            }
            if let rating = rating {
                parameters["rating"] = rating.rawValue as AnyObject
            }
            
        case let .translate(term, apiKey):
            
            parameters["api_key"] = apiKey as AnyObject
            parameters["s"] = term as AnyObject
            
        case let .random(tag, rating, apiKey):
            
            parameters["api_key"] = apiKey as AnyObject
            
            if let tag = tag {
                parameters["tag"] = tag as AnyObject
            }
            if let rating = rating {
                parameters["rating"] = rating.rawValue as AnyObject
            }
        case .gif(_, let apiKey):
            
            parameters["api_key"] = apiKey as AnyObject
            
        case let .gifs(ids, apiKey):
            
            parameters["api_key"] = apiKey as AnyObject
            parameters["ids"] = ids.joined(separator: ",") as AnyObject
        }
        
        return parameters
    }
    
    public func asURLRequest() throws -> URLRequest {
        
        let url = try GifsRouter.BaseURLString.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}

enum StickersRouter: URLRequestConvertible {
    
    static let BaseURLString = "http://api.giphy.com/v1/"
    
    case search(query: String, limit: UInt?, offset: UInt?, rating: Gif.GifRating?, language: String?, apiKey: String)
    case trending(limit: UInt?, rating: Gif.GifRating?, apiKey: String)
    case translate(String, apiKey: String)
    case random(tag: String?, rating: Gif.GifRating?, apiKey: String)
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .search(_, _, _, _, _, _):
            return ("stickers/search")
        case .trending(_, _, _):
            return ("stickers/trending")
        case .translate(_):
            return ("stickers/translate")
        case .random(_, _, _):
            return ("stickers/random")
        }
    }
    
    private var parameters: [String: AnyObject] {
        
        var parameters: [String: AnyObject] = [:]
        
        switch self {
        case let .search(keyWord, limit, offset, rating, language, apiKey):
            
            parameters["api_key"] = apiKey as AnyObject
            
            parameters["q"] = keyWord as AnyObject
            
            if let lim = limit {
                parameters["limit"] = lim as AnyObject
            }
            if let offset = offset {
                parameters["offset"] = offset as AnyObject
            }
            if let rating = rating {
                parameters["rating"] = rating.rawValue as AnyObject
            }
            if let language = language {
                parameters["lang"] = language as AnyObject
            }
            
        case let .trending(limit, rating, apiKey):
            
            parameters["api_key"] = apiKey as AnyObject
            
            if let lim = limit {
                parameters["limit"] = lim as AnyObject
            }
            if let rating = rating {
                parameters["rating"] = rating.rawValue as AnyObject
            }
            
        case let .translate(term, apiKey):
            
            parameters["api_key"] = apiKey as AnyObject
            parameters["s"] = term as AnyObject
            
        case let .random(tag, rating, apiKey):
            
            parameters["api_key"] = apiKey as AnyObject
            
            if let tag = tag {
                parameters["tag"] = tag as AnyObject
            }
            if let rating = rating {
                parameters["rating"] = rating.rawValue as AnyObject
            }
        }
        
        return parameters
    }
    
    public func asURLRequest() throws -> URLRequest {
        
        let url = try StickersRouter.BaseURLString.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
