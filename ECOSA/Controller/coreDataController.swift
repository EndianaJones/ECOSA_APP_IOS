//
//  coreDataController.swift
//  ECOSA
//
//  Created by Gerve-Endy Pluviose on 9/7/20.
//  Copyright © 2020 Gerve-Endy Pluviose. All rights reserved.
//


// ISSUE: WRITE LOGICS FOR 3 LANGUAGES
// 

//import Foundation
import CoreData
import UIKit



class coreDataController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var WeekArray = [Week]()
    var DayArray = [Day]()
//    let new_item = Day(context: self.context)
   
    //FUNCTION Save what's in context to our permanent DB
    
    func save_item(){
        
        do {
            try context.save()
        } catch  {
            print("There was an error while trying to save item \(error)")
        }
    }
    
    // FETCH THE DATA FROM LOCAL DB
    func loadWeekData(){
        let request: NSFetchRequest<Week> = Week.fetchRequest()
        do{
            WeekArray = try context.fetch(request)
        } catch {
            print("Error Fetching Data \(error)")
        }
    }
    
    //WEEK DATA COUNT
    func weekDataCount()->Int{
        self.loadWeekData()
        //WeekArray.count
        return WeekArray.count
    }
    //UPDATE WEEK DATA IN LOCAL DB
    func updateWeekData(data: Week_Struct, idx: Int) {
        
        WeekArray[idx].lesson_num = data.lesson_num
        WeekArray[idx].wk_verse_text = data.wk_verse_text
        WeekArray[idx].language = data.language
        WeekArray[idx].wk_exp_date = data.wk_exp_date
        WeekArray[idx].wk_verse = data.wk_verse
        WeekArray[idx].wk_start_date = data.wk_start_date
        WeekArray[idx].wk_title = data.wk_title
        
    
        //print(WeekArray[0].wk_verse_text!)
        self.save_item()
        
    }
    
    //ADD WEEK DATA IN LOCAL DB
    
    func addWeekData(data: Week_Struct ) {
        
        let new_week = Week(context:self.context)
        new_week.wk_title = data.wk_title
        new_week.language = data.language
        new_week.lesson_num = data.lesson_num
        new_week.wk_exp_date = data.wk_exp_date
        new_week.wk_start_date = data.wk_start_date
        new_week.wk_verse = data.wk_verse
        new_week.wk_verse_text = data.wk_verse_text
        
        self.save_item()
        
        
    }
    
    
    func checkWeekData(data: Week_Struct ) {
        //Fetch Data
        self.loadWeekData()
        var idx: Int?
        for (index, element) in WeekArray.enumerated(){
            if element.language == data.language{
                idx = index
                
                
            }
        }
        
        if idx == nil{
           self.addWeekData(data: data)
        }else{
           self.updateWeekData(data: data, idx: idx ?? 0)
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
}
