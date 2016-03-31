//  Created by Jose Marchena Torres on 15/03/16.
//  Copyright © 2016 Jose Marchena Torres. All rights reserved.

import Foundation
import Freddy

public struct BasicComic {
    public let name: String
    private let uri: String?
    
    public var comicID: Int? {
        get {
            guard let uri = uri else { return nil }
            
            if let comicID = extractComicIDFromURI(uri) {
                return comicID
            } else {
                return nil;
            }
        }
    }
}

extension BasicComic: JSONDecodable {
    
    public init(json: JSON) throws {
        self.name = try json.string("name")
        self.uri = try json.string("resourceURI")
    }
    
    func extractComicIDFromURI(uri: String) -> Int? {
        
        let tokens = uri.componentsSeparatedByString("/")
        
        if tokens.count > 0 {
            let comicID = Int(tokens.last!)
            return comicID
        }
        
        return nil;
    }
    
}

struct Comic {
    let comicInfo: BasicComic
    let pageCount: Int
    let thumbnailURL: String
    let onSaleDate: String
}