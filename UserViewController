//
//  UserViewController2.swift
//  Twitter2
//
//  Created by Jacob Hughes on 2/29/16.
//  Copyright © 2016 Jacob Hughes. All rights reserved.
//

import UIKit

class UserViewController2: UIViewController {

    @IBOutlet weak var profilePicLabel: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var numberOfTweetsLabel: UILabel!
    @IBOutlet weak var follwersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    @IBOutlet weak var headerLabel: UIImageView!
    
    var tweet: Tweet?
    
    var user: User! {
        didSet {
           // navigationItem.title = user.name
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        userNameLabel.text = tweet?.userName
        //numberOfTweetsLabel.text = tweet?.tweetCount
        
        numberOfTweetsLabel.text = "\((tweet?.user.tweetCount)!)"
        follwersLabel.text = "\((tweet?.user.followersCount)!)"
        followingLabel.text = "\((tweet?.user.followingCount)!)"
        
        profilePicLabel.setImageWithURL((tweet?.user.profileURL)!)
        headerLabel.setImageWithURL((tweet?.user.bannerImageURL)!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
