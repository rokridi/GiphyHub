//
//  GiphyHubTests.swift
//  GiphyHubTests
//
//  Created by Mohamed Aymen Landolsi on 27/07/2017.
//  Copyright © 2017 Roridi. All rights reserved.
//

import XCTest
import GiphyHub

class GiphyHubTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: GIF
    
    func testSearchGIFs() {
        
        let expectation = self.expectation(description: "searchGifs")
        
        let giphyHub = GiphyHub.init(apiKey: "96f613decdc6456ea4d522492d3b0477")
        
        let _ = giphyHub.searchGifs(query: "cat", limit: nil, offset: nil, rating: .G, language: nil, queue: nil) { (gifs, pagination, error) in
            
            expectation.fulfill()
            
            XCTAssert(error == nil, error as! String)
            XCTAssertNotNil(gifs, "Response should not be nil")
            XCTAssertNotNil(pagination, "Response should not be nil")
            
            
            for gif in gifs! {
                
                print("GIF identifier = \(gif.identifier ?? "")")
            }
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "\(String(describing: error))")
        }
    }
    
    func testTrendingGifs() {
    
        let expectation = self.expectation(description: "trendingGifs")
        
        let giphyHub = GiphyHub.init(apiKey: "96f613decdc6456ea4d522492d3b0477")
        
        let _ = giphyHub.trendingGifs(limit: nil, offset: nil, rating: nil, language: nil, queue: nil) { (gifs, pagination, error) in
            
            expectation.fulfill()
            
            XCTAssert(error == nil, error as! String)
            XCTAssertNotNil(gifs, "Response should not be nil")
            XCTAssertNotNil(pagination, "Response should not be nil")
            
            for gif in gifs! {
                
                print("GIF identifier = \(gif.identifier!)")
            }
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "\(String(describing: error))")
        }
    }
    
    func testTranslateGif() {
    
        let expectation = self.expectation(description: "translateGif")
        
        let giphyHub = GiphyHub.init(apiKey: "96f613decdc6456ea4d522492d3b0477")
        
        let _ = giphyHub.translateGif("cat", queue: nil) { (gif, error) in
            
            expectation.fulfill()
            
            XCTAssert(error == nil, error as! String)
            XCTAssertNotNil(gif, "Response should not be nil")
            
            print("GIF identifier = \(String(describing: gif?.identifier!))")
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "\(String(describing: error))")
        }
    }
    
    func testRandomGif() {
        
        let expectation = self.expectation(description: "randomGif")
        
        let giphyHub = GiphyHub.init(apiKey: "96f613decdc6456ea4d522492d3b0477")
        
        let _ = giphyHub.randomGif(nil, rating: nil, queue: nil) { (gif, error) in
            
            expectation.fulfill()
            
            XCTAssert(error == nil, error as! String)
            XCTAssertNotNil(gif, "Response should not be nil")
            
            print("GIF identifier = \(String(describing: gif?.identifier!))")
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "\(String(describing: error))")
        }
    }
    
    func testGifs() {
    
        let expectation = self.expectation(description: "gifs")
        
        let giphyHub = GiphyHub.init(apiKey: "96f613decdc6456ea4d522492d3b0477")
        
        let _ = giphyHub.gifs(identifiers: ["JIX9t2j0ZTN9S", "vFKqnCdLPNOKc"], offset: nil, rating: nil, language: nil, queue: nil) { (gifs, pagination, error) in
            
            expectation.fulfill()
            
            XCTAssert(error == nil, error as! String)
            XCTAssertNotNil(gifs, "Response should not be nil")
            XCTAssertNotNil(pagination, "Response should not be nil")
            
            for gif in gifs! {
                
                print("GIF identifier = \(gif.identifier!)")
            }
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "\(String(describing: error))")
        }
    }
    
    func testGif() {
    
        let expectation = self.expectation(description: "gif")
        
        let giphyHub = GiphyHub.init(apiKey: "96f613decdc6456ea4d522492d3b0477")
        
        let _ = giphyHub.gif(identifier: "D862bz3nKLo7C", language: nil, queue: nil) { (gif, error) in
            
            expectation.fulfill()
            
            XCTAssert(error == nil, error as! String)
            XCTAssertNotNil(gif, "Response should not be nil")
            
            print("GIF identifier = \(String(describing: gif?.identifier!))")
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "\(String(describing: error))")
        }
    }
    
    //MARK: Stickers
    
    func testSearchStickers() {
        
        let expectation = self.expectation(description: "searchGifs")
        
        let giphyHub = GiphyHub.init(apiKey: "96f613decdc6456ea4d522492d3b0477")
        
        let _ = giphyHub.searchStickers(query: "cat", limit: nil, offset: nil, rating: .G, language: nil, queue: nil) { (stickers, pagination, error) in
            
            expectation.fulfill()
            
            XCTAssert(error == nil, error as! String)
            XCTAssertNotNil(stickers, "Response should not be nil")
            XCTAssertNotNil(pagination, "Response should not be nil")
            
            for sticker in stickers! {
                
                print("Sticker identifier = \(sticker.identifier!)")
            }
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "\(String(describing: error))")
        }
    }
    
    func testTrendingStickers() {
        
        let expectation = self.expectation(description: "trendingStickers")
        
        let giphyHub = GiphyHub.init(apiKey: "96f613decdc6456ea4d522492d3b0477")
        
        let _ = giphyHub.trendingStickers(limit: nil, offset: nil, rating: nil, language: nil, queue: nil) { (stickers, pagination, error) in
            
            expectation.fulfill()
            
            XCTAssert(error == nil, error as! String)
            XCTAssertNotNil(stickers, "Response should not be nil")
            XCTAssertNotNil(pagination, "Response should not be nil")
            
            for sticker in stickers! {
                
                print("Sticker identifier = \(sticker.identifier!)")
            }
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "\(String(describing: error))")
        }
    }
    
    func testTranslateSticker() {
        
        let expectation = self.expectation(description: "translateSticker")
        
        let giphyHub = GiphyHub.init(apiKey: "96f613decdc6456ea4d522492d3b0477")
        
        let _ = giphyHub.translateSticker("cat", queue: nil) { (sticker, error) in
            
            expectation.fulfill()
            
            XCTAssert(error == nil, error as! String)
            XCTAssertNotNil(sticker, "Response should not be nil")
            
            print("Sticker identifier = \(String(describing: sticker?.identifier!))")
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "\(String(describing: error))")
        }
    }
    
    func testRandomSticker() {
        
        let expectation = self.expectation(description: "randomSticker")
        
        let giphyHub = GiphyHub.init(apiKey: "96f613decdc6456ea4d522492d3b0477")
        
        let _ = giphyHub.randomSticker(nil, rating: nil, queue: nil) { (sticker, error) in
            
            expectation.fulfill()
            
            XCTAssert(error == nil, error as! String)
            XCTAssertNotNil(sticker, "Response should not be nil")
            
            print("Sticker identifier = \(String(describing: sticker?.identifier!))")
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "\(String(describing: error))")
        }
    }
}
