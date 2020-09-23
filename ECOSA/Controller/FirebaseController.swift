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

                          print(dictionary)
                            
                            let weeekStruct = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: self.getTimeFromStamp(time: dictionary["WK_EXP_DATE"] as! Timestamp), wk_start_date: self.getTimeFromStamp(time: dictionary["WK_START_DATE"] as! Timestamp), wk_title: (dictionary["WK_TITTLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                            
                             //let weeekStruct = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: nil, wk_start_date: nil, wk_title: (dictionary["WK_TITTLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                            
                            coreDataAccess.checkWeekData(data: weeekStruct)
                            print("Done ENG")
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

                           print(dictionary)
                             
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

                      print(dictionary)
                        
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
    
    //fetch data week info from database
    func getWeekENG() -> Int {
        
        let coreDataAccess = coreDataController()
        
        db.collection("week").getDocuments() { (querySnapshot, err) in
            
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                
                let dictionary = document.data()

              
                
               // let weeekStruct = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: self.getTimeFromStamp(time: dictionary["WK_EXP_DATE"] as! Timestamp), wk_start_date: self.getTimeFromStamp(time: dictionary["WK_START_DATE"] as! Timestamp), wk_title: (dictionary["WK_TITTLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                
                 let weeekStruct = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: nil, wk_start_date: nil, wk_title: (dictionary["WK_TITTLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                
                _ = coreDataAccess.checkWeekData(data: weeekStruct)
                
                

                
             
            }
            
            
        }
            
           

    }
        
        return 1
  }
    
    
      //------------ FRENCH --------------
      
      //fetch data week info from database
      func getWeekFR()  {
        
          let coreDataAccess = coreDataController()
          db.collection("semaine").getDocuments() { (querySnapshot, err) in
           
          if let err = err {
              print("Error getting documents: \(err)")
          } else {
              for document in querySnapshot!.documents {
                  
                  let dictionary = document.data()

                
                  
                //let weeekStructSPH = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: self.getTimeFromStamp(time: dictionary["WK_EXP_DATE"] as! Timestamp), wk_start_date: self.getTimeFromStamp(time: dictionary["WK_START_DATE"] as! Timestamp), wk_title: (dictionary["WK_TITTLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                
                
                  let weeekStruct = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: nil, wk_start_date: nil, wk_title: (dictionary["WK_TITTLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                
                 _ =  coreDataAccess.checkWeekData(data: weeekStruct)
                  
                


                  
               
              }
             
          }
            
            

      }
    }
    
    //------------ SPANISH --------------
      
      //fetch data week info from database
      func getWeekSPH()  {
          let coreDataAccess = coreDataController()
          db.collection("semana").getDocuments() { (querySnapshot, err) in
          if let err = err {
              print("Error getting documents: \(err)")
          } else {
              for document in querySnapshot!.documents {
                  
                  let dictionary = document.data()

                print(dictionary)
                  
                  let weeekStruct = Week_Struct(lesson_num: dictionary["LESSON_NUM"] as! Int16, language: (dictionary["LNG"] as! String), wk_exp_date: self.getTimeFromStamp(time: dictionary["WK_EXP_DATE"] as! Timestamp), wk_start_date: self.getTimeFromStamp(time: dictionary["WK_START_DATE"] as! Timestamp), wk_title: (dictionary["WK_TITTLE"] as? String)!, wk_verse: (dictionary["WK_VERSE"] as? String)!, wk_verse_text: (dictionary["WK_VERSE_TEXT"] as? String)!)
                
            
                 _ =  coreDataAccess.checkWeekData(data: weeekStruct)
                  

                  
               
              }
          }

      }
    }
    
    
    
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
    
   
    
    
       //------------ FRENCH --------------
}
