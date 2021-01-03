//
//  videoStruct.swift
//  ECOSA
//
//  Created by Gerve-Endy Pluviose on 12/30/20.
//  Copyright © 2020 Gerve-Endy Pluviose. All rights reserved.
//

import Foundation

struct Video : Decodable {
    var videoId=""
    var title=""
    var description=""
    var thumbnail=""
    var published = ""
    
    enum Codingkeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourceId
                
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
   /* init (from decoder: Decoder) throws {
            
        //let contain = try decoder.container(keyedBy: CodingKey.self)
        
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
            
            // Parse title
            self.title = try snippetContainer.decode(String.self, forKey: .title)
            
            // Parse description
            self.description = try snippetContainer.decode(String.self, forKey: .description)
            
            // Parse the publish date
            self.published = try snippetContainer.decode(Date.self, forKey: .published)
            
            // Parse thumbnails
            let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
            
            let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
            
            self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
            
            // Parse Video ID
            let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
            
            self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        } */
}
