import UIKit
import BDBOAuth1Manager
import AFNetworking

class ViewController: UIViewController {
    
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var Btn: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        ///let imageData = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("spiral", withExtension: "gif")!)
        ///let imageGif = UIImage.gifWithData(imageData!)
        ///let imageView = UIImageView(image: imageGif)
        ///imageView.frame = CGRect(x: 0.0, y:0.0, width: 375,height: 700)
        ///view.addSubview(imageView)
        ///view.sendSubviewToBack(imageView)
        
        
        
        
        
        
        /*
        let array = ["bg1.jpg", "bg2.jpg"]
        //let randomIndex = Int(arc4random_addrandom(Int(array.count)))
        print(array[0])
        var i = Int(arc4random_uniform(2))
        print(i)
        print(array[i])
        */
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2.jpg")!)
        
        /*
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        view.addSubview(blurEffectView)
        */
        
        
        Btn.center.x = self.view.frame.width + 99
        
        imageLabel.center.x = self.view.frame.width + 150
        
        UIView.animateWithDuration(1.0, delay: 1.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: ({
            
            self.Btn.center.x = self.view.frame.width / 2
            
        }), completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 1.3, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: ({
            
            self.imageLabel.center.x = self.view.frame.width / 2
            
        }), completion: nil)
        
        /*
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2.jpg")!)
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        view.addSubview(blurEffectView)
        */
      
        
        
        
        Btn.backgroundColor = UIColor.whiteColor()
        Btn.layer.cornerRadius = 10.0
        Btn.clipsToBounds = true
        
        //welcomeLabel.backgroundColor = UIColor.black//Color()
        welcomeLabel.layer.cornerRadius = 10.0
        welcomeLabel.clipsToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onLogin(sender: AnyObject) {
    
        let client = TwitterClient.sharedInstance
        client.login({ () -> () in
            print("I've logged in")
            self.performSegueWithIdentifier("loginSegue", sender: nil)
            }) { (error: NSError) -> () in
                print("Error login: \(error.localizedDescription)")
        }
    }
}
