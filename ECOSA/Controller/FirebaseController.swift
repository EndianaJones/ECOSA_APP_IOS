//
//  FirebaseController.swift
//  ECOSA
//
//  Created by Gerve-Endy Pluviose on 9/5/20.
//  Copyright © 2020 Gerve-Endy Pluviose. All rights reserved.
//

import Foundation
import Firebase


class FirebaseController{
    let db = Firestore.firestore()
    
    
    func getTimeFromStamp(time: Timestamp) -> Date{
        let second = time.seconds
        return Date(timeIntervalSince1970: Double(second))//finalDate
    }

    func AllWeek() {
        let coreDataAccess = coreDataController()
        
        let semaphore = DispatchSemaphore(value: 0)
        let dispatchQueue =  DispatchQueue.global(qos: .background)
        
        dispatchQueue.async{
            
                    self.db.collection("week").getDocuments() { (querySnapshot, err) in
                        
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            
                            let dictionary = document.data()

                         
                            
                            let weeekStruct = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: self.getTimeFromStamp(time: dictionary["WK_EXP_DATE"] as! Timestamp), wk_start_date: self.getTimeFromStamp(time: dictionary["WK_START_DATE"] as! Timestamp), wk_title: (dictionary["WK_TITTLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                            
                             //let weeekStruct = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: nil, wk_start_date: nil, wk_title: (dictionary["WK_TITTLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                            
                            coreDataAccess.checkWeekData(data: weeekStruct)
                            
                            semaphore.signal()

                            
                         
                        }
                        
                        
                    }
                        
                }
            semaphore.wait()
            
            
            self.db.collection("semaine").getDocuments() { (querySnapshot, err) in
                      
                     if let err = err {
                         print("Error getting documents: \(err)")
                     } else {
                         for document in querySnapshot!.documents {
                             
                             let dictionary = document.data()

                           
                             
                           let weeekStructFr = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: self.getTimeFromStamp(time: dictionary["WK_EXP_DATE"] as! Timestamp), wk_start_date: self.getTimeFromStamp(time: dictionary["WK_START_DATE"] as! Timestamp), wk_title: (dictionary["WK_TITLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                           
                           
                            // let weeekStructFr = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: nil, wk_start_date: nil, wk_title: (dictionary["WK_TITTLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                           
                            coreDataAccess.checkWeekData(data: weeekStructFr)
                             
                           
                            semaphore.signal()


                             
                          
                         }
                        
                     }
                       
                       

                 }
            semaphore.wait()
            
            self.db.collection("semana").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        
                        let dictionary = document.data()

                      
                        
                        let weeekStructSPN = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: self.getTimeFromStamp(time: dictionary["WK_EXP_DATE"] as! Timestamp), wk_start_date: self.getTimeFromStamp(time: dictionary["WK_START_DATE"] as! Timestamp), wk_title: (dictionary["WK_TITLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                      
                  
                       coreDataAccess.checkWeekData(data: weeekStructSPN)
                        

                        
                     
                    }
                }

            }
            semaphore.wait()
            
            
        }
        
        
        
        //ENG
    }
    
    
    //------------ ENGLISH --------------
    
    
    
//GET WEEK DAY
    
        func getDayENG()  {
            db.collection("/week/qC3tu1dbzhxtnT5NXV84/day").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data()) \n")
                    
                    
                    
                 
                }
            }

        }
      }
    
    
   //------------ DAY UPDATE --------------
    
   
    func AllDays() {
        let coreDataAccess = coreDataController()
        
        let semaphore = DispatchSemaphore(value: 0)
        let dispatchQueue =  DispatchQueue.global(qos: .background)
        
        dispatchQueue.async{
            
                    self.db.collection("/week/qC3tu1dbzhxtnT5NXV84/day").getDocuments() { (querySnapshot, err) in
                        
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            
                            let dictionary = document.data()

                            //print(dictionary)
                            
                            let dayStructENG = Day_Struct(D_Date: self.getTimeFromStamp(time: dictionary["D_DATE"] as! Timestamp) , D_Day: dictionary["D_DAY"] as! String, D_Text: dictionary["D_TEXT"] as! String, D_Title: dictionary["D_TITLE"] as! String, D_Verse: dictionary["D_VERSE"] as! NSArray, D_LNG: dictionary["LNG"] as! String)
                             
                            
                            coreDataAccess.checkDayData(data: dayStructENG)
                            
                            semaphore.signal()

                            
                         
                        }
                        
                        
                    }
                        
                }
            semaphore.wait()
            
            
            self.db.collection("/semaine/cbwsluhEBco6n6VJ7k2v/day").getDocuments() { (querySnapshot, err) in
                      
                     if let err = err {
                         print("Error getting documents: \(err)")
                     } else {
                         for document in querySnapshot!.documents {
                             
                             let dictionary = document.data()
                            //print(dictionary)

                           
                             
                            let dayStructFR = Day_Struct(D_Date: self.getTimeFromStamp(time: dictionary["D_DATE"] as! Timestamp) , D_Day: dictionary["D_DAY"] as! String, D_Text: dictionary["D_TEXT"] as! String, D_Title: dictionary["D_TITLE"] as! String, D_Verse: dictionary["D_VERSE"] as? NSArray, D_LNG: dictionary["LNG"] as! String)
                           
                            coreDataAccess.checkDayData(data: dayStructFR)
                             
                           
                            semaphore.signal()


                             
                          
                         }
                        
                     }
                       
                       

                 }
            semaphore.wait()
            
            self.db.collection("/semana/9EaM4MNvF83hI7OU0pav/day").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        
                        let dictionary = document.data()
                        //print(dictionary)

                      
                        let dayStructSPH = Day_Struct(D_Date: self.getTimeFromStamp(time: dictionary["D_DATE"] as! Timestamp) , D_Day: dictionary["D_DAY"] as! String, D_Text: dictionary["D_TEXT"] as! String, D_Title: dictionary["D_TITLE"] as! String, D_Verse: dictionary["D_VERSE"] as! NSArray, D_LNG: dictionary["LNG"] as! String)
                      
                  
                       coreDataAccess.checkDayData(data: dayStructSPH)
                        

                        
                     
                    }
                }

            }
            semaphore.wait()
            
            
        }
        
        
        
        //ENG
    }
    
       //------------ FRENCH --------------
}
