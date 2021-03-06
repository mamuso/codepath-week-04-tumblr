//
//  AccountViewController.swift
//  codepath-week-04-tumblr
//
//  Created by Manuel Muñoz Solera on 10/11/15.
//  Copyright © 2015 Manuel Muñoz Solera. All rights reserved.
//

import UIKit

class AccountViewController: ViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var accountImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting up the scroll.
        scrollView.contentSize = accountImageView.frame.size
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
