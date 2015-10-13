//
//  DiscoverViewController.swift
//  codepath-week-04-tumblr
//
//  Created by Manuel Muñoz Solera on 10/11/15.
//  Copyright © 2015 Manuel Muñoz Solera. All rights reserved.
//

import UIKit

class DiscoverViewController: ViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var spinnerImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = feedView.frame.size

        spinnerImage.animationImages = [UIImage(named: "loading-1")!,
            UIImage(named: "loading-2")!,
            UIImage(named: "loading-3")!
        ]
        spinnerImage.animationDuration = 0.5
        spinnerImage.startAnimating()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        scrollView.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        UIView.animateWithDuration(0.2, delay: 2, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.scrollView.alpha = 1
            }, completion: nil)
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
