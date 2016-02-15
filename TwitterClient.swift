//
//  TwitterClient.swift
//  Twitter
//
//  Created by Windell Greene on 2/14/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "rFaI33enMPnsumh5ED5umj0H4"
let twitterConsumerSecret = "5IaFh6VKREMFxSzVXO2Nreyivpcf5jEEejJGkKMaIZjDeSizBP"
let twitterBaseUrl = NSURL(string: "https://api.twitter.com")


class TwitterClient: BDBOAuth1SessionManager {
    var loginCompletion: ((user: User?, error: NSError?) -> ())?
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseUrl, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        
        return Static.instance
    }
    
    func homeTimelineWithParams(params: NSDictionary?, completion:  (tweets: [Tweet]?, error: NSError?) -> ()) {
        GET("1.1/account/verify_credentials.json", parameters: params, success: { (operation: NSURLSessionDataTask!, response: AnyObject?) -> Void in
            print("home_timeline: \(response)")
            var tweets = Tweet.tweetsWithArray(response as [NSDictionary])
            
            
            }) failure: { (operation: NSURLSessionDataTask?, error: NSError!) -> Void in
                // print("error gettting home timeline")
        })
    }
    
    func loginWithCompletion: (user: User?, error: NSError?) -> ()) {
        loginCompletion = completion
        // Fetch request token & redirect to authorization page
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/ request_token", method: "GET", callbackURL: NSURL(string: "cptwitterJon://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            print("Got the request token")
            let authURL = NSURL(string:"https://api.twitter.com/oauth/authorize?oauth=\(requestToken.token)")
            UIApplication.sharedApplication().openURL((authURL)!)
        })  { (error: NSError!) -> Void in
                print("Failed to get request token")
                self.loginCompletion?(user: nil, error: error)
    
        }
    }
    
    func openURL(url: NSURL) {
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken:BDBOAuth1Credential(queryString: url.query), success: { (accessToken: BDBOAuth1Credential!) -> Void in
            print("Got access token")
            TwitterClient.sharedInstance.requestSerializer.saveAccessToken(accessToken)
            
            
            TwitterClient.sharedInstance.GET("1.1/account/verify_credentials.json", parameters: nil, success: { (operation: NSURLSessionDataTask!, response: AnyObject?) -> Void in
                // print("user: \(response)")
                var user = User(dictionary: response as NSDictionary)
                User.currentUser = user
                print("user: \(response)")
                self.loginCompletion?(user: user, error: nil)
                // print("user:\(user.name)")
            }, failure: {(operation: NSURLSessionDataTask?, error: NSError!) -> Void in
                print("error getting current user")
                self.loginCompletion?(user: nil, error: error)
            })
            
            
            
            
            }) { (error: NSError!) -> Void in
                print("Failed to receive access token")
                self.loginCompletion?(user: nil, error: error)
                
        }
    }
    
    
    
    
}

