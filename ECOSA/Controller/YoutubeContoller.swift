//
//  YoutubeContoller.swift
//  ECOSA
//
//  Created by Gerve-Endy Pluviose on 12/27/20.
//  Copyright © 2020 Gerve-Endy Pluviose. All rights reserved.
//

import Foundation
import Alamofire

class YoutubeContoller {
    let API_key = "AIzaSyAPhnhhICCagw6gEPIa6FcxIADglxjFaBo"
    let Playlist_key = "UUCtp4UbQIrxgu41T5Hc5bug"
    let API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet%2CcontentDetails&maxResults=5&playlistId=UUCtp4UbQIrxgu41T5Hc5bug&key=AIzaSyAPhnhhICCagw6gEPIa6FcxIADglxjFaBo"
    
    func getFeedVideo(){
        
        
        
        
        
        //Fetch Video'
        // start
       
        
        AF.request("https://youtube.googleapis.com/youtube/v3/playlistItems", method: .get, parameters: ["part":"snippet", "playlistId":Playlist_key, "key":API_key], headers: nil).responseJSON { (response) -> Void in
                
            
            //print(response.data)
            if let jsonObj = try? JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as? NSDictionary

            {
                if let items = jsonObj["items"] as? NSArray {
                    if let snipper = 
                    for item in items {
                       
                     
                        
                    }
                }
                
            }
            
                        
            
            //print(response.result.value)
            /*
            if let JSON = response.result.value{
                for video in JSON["items"] as! NSArray {
                    print(video)
                }
            }*/
            
        }

        //end
        
        
      /*
         let url = URL(string: API_URL)!
        //print(url)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, respons, error) in
            
            print("IN DataTask")
            print(data)
            
            if error != nil || data == nil {
                print("the error is \(error)")
            }
            
        }
        
        
        
        dataTask.resume()
        */
        
    }
    
}


