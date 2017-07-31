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
    
    func testSerachGIFs() {
        
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
    
    func testSerachStickers() {
        
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
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
