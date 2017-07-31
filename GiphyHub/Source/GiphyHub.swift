//
//  GiphyHub.swift
//  GiphyHub
//
//  Created by Mohamed Aymen Landolsi on 26/07/2017.
//  Copyright © 2017 Roridi. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

public class GiphyHub {
    
    let apiKey: String
    let sessionManager: SessionManager
    
    init(apiKey: String, sessionConfiguration: URLSessionConfiguration) {
        
        sessionManager = Alamofire.SessionManager(configuration: sessionConfiguration)
        self.apiKey = apiKey
    }
    
    convenience init(apiKey key: String) {
        self.init(apiKey: key, sessionConfiguration: URLSessionConfiguration.default)
    }
    
    //MARK: GIF
    
    func searchGifs(query: String, limit: UInt?, offset:UInt?, rating:Gif.GifRating?, language: String?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = GifsRouter.search(query: query, limit: limit, offset: offset, rating: rating, language: language, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: completionHandler)
    }
    
    func trendingGifs(limit: UInt?, offset:UInt?, rating:Gif.GifRating?, language: String?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = GifsRouter.trending(limit: limit, rating: rating, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: completionHandler)
    }
    
    func translateGif(_ term: String, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = GifsRouter.translate(term, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: completionHandler)
    }
    
    func randomGif(_ tag: String?, rating:Gif.GifRating?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = GifsRouter.random(tag: tag, rating: rating, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: completionHandler)
    }
    
    func gifs(identifiers: [String], offset:UInt?, rating:Gif.GifRating?, language: String?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = GifsRouter.gifs(identifiers: identifiers, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: completionHandler);
    }
    
    func gif(identifier: String, rating:Gif.GifRating?, language: String?, queue: DispatchQueue?, completionHandler: @escaping (Gif?, Error?) -> Void) -> DataRequest {
        
        return self.gifs(identifiers: [identifier], offset: nil, rating: nil, language: nil, queue: queue) { (gifs, _, error) in
            
            completionHandler(gifs?.first, error)
        }
    }
    
    //MARK: Stickers
    
    func searchStickers(query: String, limit: UInt?, offset:UInt?, rating:Gif.GifRating?, language: String?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = StickersRouter.search(query: query, limit: limit, offset: offset, rating: rating, language: language, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: completionHandler)
    }
    
    func trendingStickers(limit: UInt?, offset:UInt?, rating:Gif.GifRating?, language: String?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = StickersRouter.trending(limit: limit, rating: rating, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: completionHandler)
    }
    
    func translateSticker(_ term: String, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = StickersRouter.translate(term, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: completionHandler)
    }
    
    func randomSticker(_ tag: String?, rating:Gif.GifRating?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = StickersRouter.random(tag: tag, rating: rating, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: completionHandler)
    }
    
    //MARK: Private
    
    private func launchRequest(_ urlRequest: URLRequestConvertible, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        return sessionManager.request(urlRequest).validate().responseObject(queue: queue, keyPath: nil, mapToObject: nil, context: nil, completionHandler: { (response:DataResponse<GifReponse>) in
            
            let gifResponse = response.result.value
            
            (queue ?? DispatchQueue.main).async { completionHandler(gifResponse?.gifs, gifResponse?.pagination, response.error) }
        })
    }
}
