//
//  ViewController.swift
//  HorizontalCalenderWithCustomDate
//
//  Created by apple on 11/07/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var dateCollectionView: UICollectionView!
    
    var selectedIndexInCollection = Int ()
    
    
    var datesArrayByAddingDays:[Date]?
    
    var completeDateArray:[String]?
    var dayNameArray:[String]?
    var monthNameArray:[String]?
    var dateNumberArray:[String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        datesArrayByAddingDays = Date().generateDates(startDate: Date(), addbyUnit: .day, value: 60)
        
        //let datesArrayByAddingMonths = Date().generateDates(startDate: Date(), addbyUnit: .month, value: 4)
        
        completeDateArray = Date().convertDatesArrayToStringFormat(dates: datesArrayByAddingDays!)
        
        //components array
        dayNameArray = Date().getDayNameArrayFromDates(dates: datesArrayByAddingDays!)
        monthNameArray = Date().getMonthArrayFromDates(dates: datesArrayByAddingDays!)
        dateNumberArray =  Date().getDateNumberArrayFromDates(dates: datesArrayByAddingDays!)
        
    }
    
    //TimeTable Date Collection
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        var cellSize:CGSize = CGSize(width: 50, height: 60)
        return cellSize
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (datesArrayByAddingDays?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: TimeTableCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeTableCollectionCell", for: indexPath as IndexPath) as! TimeTableCollectionCell
        
        cell.contentView.setCardView(view: cell.contentView)
        
        cell.dateLabel.text =  dateNumberArray?[indexPath.row]
        cell.monthLabel.text =  monthNameArray?[indexPath.row].uppercased()
        cell.dayLabel.text = dayNameArray?[indexPath.row].uppercased()
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var cell: TimeTableCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeTableCollectionCell", for: indexPath as IndexPath) as! TimeTableCollectionCell
        
        selectedIndexInCollection = indexPath.row
        
        //selectedDateLabel.text =   "\(String(describing: cell.dayLabel.text!)), \(String(describing: cell.dateLabel.text!)) \(String(describing: cell.monthLabel.text!)) 2017"
        
        self.dateCollectionView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

