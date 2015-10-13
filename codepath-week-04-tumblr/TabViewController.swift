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
    @IBOutlet weak var tooltipView: UIImageView!
    
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
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("ActivityViewController")
        composerViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController")
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]

        // Loading home
        homeViewController.view.frame = contentView.frame
        contentView.addSubview(homeViewController.view)
        
        // Animating the tooltip
        tooltipAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressTab(sender: AnyObject) {
        // selecting the tab
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].selected = false
        buttons[selectedIndex].selected = true
        
        // What's up, tooltip!
        let alpha = CGFloat(selectedIndex == 1 ? 0.0 : 1.0)
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.tooltipView.alpha = alpha
            }, completion: nil)
        
        
        // loading the view
        let previousVC = viewControllers[previousIndex]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        
    }
    
    @IBAction func didPressCompose(sender: AnyObject) {
        let vc = composerViewController
        vc.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        presentViewController(vc, animated: true, completion: nil)
    }
    
    // Tooltip Animation
    func tooltipAnimation() {
        tooltipView.alpha = 1
        UIView.animateWithDuration(0.8, delay: 0, options: [UIViewAnimationOptions.Repeat, UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.CurveEaseInOut], animations: { () -> Void in
            self.tooltipView.transform = CGAffineTransformMakeTranslation(0, -3)
            }, completion: nil)
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
