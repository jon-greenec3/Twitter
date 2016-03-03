//
//  Data.swift
//  Twitter2
//
//  Created by Jacob Hughes on 2/21/16.
//  Copyright © 2016 Jacob Hughes. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelFavoriteNumber: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var labelRetweetNumber: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelUserHandle: UILabel!
    @IBOutlet weak var imageProfilePicture: UIImageView!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var buttonRetweet: UIButton!
    
    var tweet: Tweet?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var buttonFavorite: UIButton!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func favoriteAction(sender: AnyObject) {
        if(tweet?.favorited == 0){
            buttonFavorite.setImage(UIImage(named: "like-action-pink"), forState: .Normal)
            labelFavoriteNumber.textColor = UIColor.redColor()
            tweet?.favorited = 1
            
            var pastFavorite = Int(self.labelFavoriteNumber.text!)
            pastFavorite = pastFavorite! + 1
            self.labelFavoriteNumber.text = String(pastFavorite!)
            
            
        }
        else{
            buttonFavorite.setImage(UIImage(named: "like-action-grey"), forState: .Normal)
            labelFavoriteNumber.textColor = UIColor.grayColor()
            tweet?.favorited = 0
            
            var pastFavorite = Int(self.labelFavoriteNumber.text!)
            pastFavorite = pastFavorite! - 1
            self.labelFavoriteNumber.text = String(pastFavorite!)
        }
        
        
    }
    @IBAction func retweetAction(sender: AnyObject) {
        if(tweet?.retweeted == 0){
            buttonRetweet.setImage(UIImage(named: "retweet-action-green"), forState: .Normal)
            labelRetweetNumber.textColor = UIColor(red: 0, green: 0.8, blue: 0, alpha: 1)
            tweet?.retweeted = 1
            
            var pastRetweet = Int(self.labelRetweetNumber.text!)
            pastRetweet = pastRetweet! + 1
            self.labelRetweetNumber.text = String(pastRetweet!)
            
        }
        else{
            buttonRetweet.setImage(UIImage(named: "retweet-action-grey"), forState: .Normal)
            labelRetweetNumber.textColor = UIColor.grayColor()
            tweet?.retweeted = 0
            
            
            var pastRetweet = Int(self.labelRetweetNumber.text!)
            pastRetweet = pastRetweet! - 1
            self.labelRetweetNumber.text = String(pastRetweet!)
            
        }
        
        
    }
}
