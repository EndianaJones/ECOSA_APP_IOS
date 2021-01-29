//
//  YoutubeContoller.swift
//  ECOSA
//
//  Created by Gerve-Endy Pluviose on 12/27/20.
//  Copyright © 2020 Gerve-Endy Pluviose. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public var VideoArray = [Video_Struct]()

class YoutubeContoller {
    let API_key = "AIzaSyAPhnhhICCagw6gEPIa6FcxIADglxjFaBo"
    let Playlist_key = "UUCtp4UbQIrxgu41T5Hc5bug"
    let API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet%2CcontentDetails&maxResults=5&playlistId=UUCtp4UbQIrxgu41T5Hc5bug&key=AIzaSyAPhnhhICCagw6gEPIa6FcxIADglxjFaBo"
    
    
    
    func getFeedVideo(){
        
        
        
        
        
        //Fetch Video'
        // start
       
        
        AF.request("https://youtube.googleapis.com/youtube/v3/playlistItems", method: .get, parameters: ["part":"snippet", "playlistId":Playlist_key, "key":API_key], headers: nil).responseJSON { (response) -> Void in
                
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as? NSDictionary

            {
                
                let json = JSON(jsonObj)
                if let jsonArray = json["items"].array{
                    for videoItem in jsonArray{
                        //print("THIS IS WHAT IS IN VIDEO \(videoItem)")
                        var youTitle = videoItem["snippet"]["title"].string!
                        var youThumbnail = videoItem["snippet"]["thumbnails"]["high"]["url"].string!
                        var youVideoId = videoItem["snippet"]["resourceId"]["videoId"].string!
                        var youPublished = videoItem["snippet"]["publishedAt"].string!
                        
                        var VdeoStruct = Video_Struct(videoId: youVideoId, title: youTitle, thumbnail: youThumbnail, published: youPublished)
                        
                        VideoArray.append(VdeoStruct)
                        
                        
                        
                    }
                    
                }
               
                
                
            }
                
                
            
        }
        
    }
    
}


