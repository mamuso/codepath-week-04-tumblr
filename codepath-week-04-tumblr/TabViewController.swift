//
//  TabViewController.swift
//  codepath-week-04-tumblr
//
//  Created by mmuno on 10/12/15.
//  Copyright © 2015 Manuel Muñoz Solera. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var contentView: UIView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composerViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!

    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting up the different controllers
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("DiscoverViewController")
        composerViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("ActivityViewController")
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]

        
        // Loading home
        homeViewController.view.frame = contentView.frame
        contentView.addSubview(homeViewController.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressTab(sender: AnyObject) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        print(sender.tag)
        
        buttons[previousIndex].selected = false
        buttons[selectedIndex].selected = true

        
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
