//
//  TimeTableViewCell.swift
//  WeatherApplication
//
//  Created by Thejeswara Reddy on 25/02/21.
//

import Foundation
import UIKit

class TimeTableViewCell : UITableViewCell{
    
    @IBOutlet weak var tableCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableCollectionView.delegate = self
        tableCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
extension TimeTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCollectionViewCell", for: indexPath) as? TimeCollectionViewCell {
            
            if indexPath.row == 1 {
                cell.timeLabel.text = "12:00PM"
                cell.tempLabel.text = "32C"
            }
            if indexPath.row == 2 {
                cell.timeLabel.text = "1:00PM"
                cell.tempLabel.text = "33C"
            }
            if indexPath.row == 3 {
                cell.timeLabel.text = "2:00PM"
                cell.tempLabel.text = "34C"
            }
            if indexPath.row == 4 {
                cell.timeLabel.text = "3:00PM"
                cell.tempLabel.text = "35C"
            }
            if indexPath.row == 5 {
                cell.timeLabel.text = "4:00PM"
                cell.tempLabel.text = "33C"
            }
            return cell
        }
        return UICollectionViewCell()
    }
}
