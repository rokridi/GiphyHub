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
    private let sessionManager: SessionManager
    private var timeout  = 10
    
    init(apiKey: String, sessionConfiguration: URLSessionConfiguration, timeout:Int = 10) {
        
        sessionManager = Alamofire.SessionManager(configuration: sessionConfiguration)
        self.apiKey = apiKey
        self.timeout = timeout
    }
    
    convenience init(apiKey key: String) {
        self.init(apiKey: key, sessionConfiguration: URLSessionConfiguration.default)
    }
    
    //MARK: GIF
    
    func searchGifs(query: String, limit: UInt?, offset:UInt?, rating:Gif.GifRating?, language: String?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = GifsRouter.search(query: query, limit: limit, offset: offset, rating: rating, language: language, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: { (response, error) in
            
            let response = response as? GifsResponse
            
            completionHandler(response?.gifs, response?.pagination, error)
        })
    }
    
    func trendingGifs(limit: UInt?, offset:UInt?, rating:Gif.GifRating?, language: String?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = GifsRouter.trending(limit: limit, rating: rating, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: { (response, error) in
            
            let response = response as? GifsResponse
            
            completionHandler(response?.gifs, response?.pagination, error)
        })
    }
    
    func translateGif(_ term: String, queue: DispatchQueue?, completionHandler: @escaping (Gif?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = GifsRouter.translate(term, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: { (response, error) in
            
            let response = response as? GifResponse
            
            completionHandler(response?.gif, error)
        })
    }
    
    func randomGif(_ tag: String?, rating:Gif.GifRating?, queue: DispatchQueue?, completionHandler: @escaping (Gif?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = GifsRouter.random(tag: tag, rating: rating, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: { (response, error) in
            
            let response = response as? GifResponse
            
            completionHandler(response?.gif, error)
        })
    }
    
    func gifs(identifiers: [String], offset:UInt?, rating:Gif.GifRating?, language: String?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = GifsRouter.gifs(identifiers: identifiers, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: { (response, error) in
            
            let response = response as? GifsResponse
            
            completionHandler(response?.gifs, response?.pagination, error)
        })
    }
    
    func gif(identifier: String, language: String?, queue: DispatchQueue?, completionHandler: @escaping (Gif?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = GifsRouter.gif(identifier: identifier, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: { (response, error) in
            
            let response = response as? GifResponse
            
            completionHandler(response?.gif, error)
        })
    }
    
    //MARK: Stickers
    
    func searchStickers(query: String, limit: UInt?, offset:UInt?, rating:Gif.GifRating?, language: String?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = StickersRouter.search(query: query, limit: limit, offset: offset, rating: rating, language: language, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: { (response, error) in
            
            let response = response as? GifsResponse
            
            completionHandler(response?.gifs, response?.pagination, error)
        })
    }
    
    func trendingStickers(limit: UInt?, offset:UInt?, rating:Gif.GifRating?, language: String?, queue: DispatchQueue?, completionHandler: @escaping ([Gif]?, GifPagination?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = StickersRouter.trending(limit: limit, rating: rating, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: { (response, error) in
            
            let response = response as? GifsResponse
            
            completionHandler(response?.gifs, response?.pagination, error)
        })
    }
    
    func translateSticker(_ term: String, queue: DispatchQueue?, completionHandler: @escaping (Gif?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = StickersRouter.translate(term, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: { (response, error) in
            
            let response = response as? GifResponse
            
            completionHandler(response?.gif, error)
        })
    }
    
    func randomSticker(_ tag: String?, rating:Gif.GifRating?, queue: DispatchQueue?, completionHandler: @escaping (Gif?, Error?) -> Void) -> DataRequest {
        
        let urlRequest = StickersRouter.random(tag: tag, rating: rating, apiKey: apiKey)
        
        return self.launchRequest(urlRequest, queue: queue, completionHandler: { (response, error) in
            
            let response = response as? GifResponse
            
            completionHandler(response?.gif, error)
        })
    }
    
    //MARK: Private
    
    private func launchRequest(_ urlRequest: URLRequestConvertible, queue: DispatchQueue?, completionHandler: @escaping (GiphyResponse?, Error?) -> Void) -> DataRequest {
        
        return sessionManager.request(urlRequest).validate().responseObject(queue: queue, keyPath: nil, mapToObject: nil, context: nil, completionHandler: { (response:DataResponse<GiphyResponse>) in
            
            let gifResponse = response.result.value
            
            (queue ?? DispatchQueue.main).async { completionHandler(gifResponse, response.error) }
        })
    }
}
