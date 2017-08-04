# GiphyHub
GiphyHub is library for calling [Giphy API](https://github.com/Giphy/GiphyAPI). This library is written in Swift.

# Requirements

- iOS 8.0+
- Xcode 8.1, 8.2, 8.3, and 9.0
- Swift 4.0

# Installation
[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build GiphyHub.

To integrate GiphyHub into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target '<Your Target Name>' do
    pod 'GiphyHub', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

### Request example

The following example shows how to use Giphy API to search GIFs.

```swift
import GiphyHub

let giphyHub = GiphyHub.init(apiKey: "YOUR_API_KEY")
        
let _ = giphyHub.searchGifs(query: "cat", limit: nil, offset: nil, rating: .G, language: nil, queue: nil) { (gifs, pagination, error) in
            
            if let gifs = gifs {
              for gif in gifs {  
                  print("GIF identifier = \(gif.identifier ?? "")")
              }
            }
        }
```
