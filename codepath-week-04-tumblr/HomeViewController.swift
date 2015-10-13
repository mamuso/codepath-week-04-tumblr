//
//  HomeViewController.swift
//  codepath-week-04-tumblr
//
//  Created by Manuel Muñoz Solera on 10/11/15.
//  Copyright © 2015 Manuel Muñoz Solera. All rights reserved.
//

import UIKit

class HomeViewController: ViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var spinnerImageView: UIImageView!
    
    // General spring animation options
    let duration = 0.8
    let delay = 0.0
    let options = UIViewAnimationOptions.CurveEaseInOut
    let damping = CGFloat(0.55)
    let velocity = CGFloat(1.0)

    
    var loginViewController: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up the objects
        houseImageView.transform = CGAffineTransformMakeScale(0.2, 0.2)
        houseImageView.alpha = 0.0

        spinnerImageView.transform = CGAffineTransformMakeScale(0.2, 0.2)
        spinnerImageView.alpha = 0.0

        // Setting up the scroll
        scrollView.contentSize = contentView.frame.size
        
        // Triggering the house animation
        houseAnimation()
        
        
        // Setting up the different controllers
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        loginViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // House Animation
    func houseAnimation() {
        UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: options, animations: { () -> Void in
            self.houseImageView.alpha = 1.0
            self.houseImageView.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: {finished in
                // Triggering the spinner animation
                self.spinnerAnimation()
            }
        )
        
    }
    
    // Spinner Animation
    func spinnerAnimation() {
        let angle = (CGFloat(20) * CGFloat(M_PI)) / 180
        
        UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: options, animations: { () -> Void in
            self.spinnerImageView.alpha = 1.0
            self.spinnerImageView.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil
        )
        
        UIView.animateWithDuration(1.0, delay: 0, options: [UIViewAnimationOptions.Repeat, UIViewAnimationOptions.CurveLinear], animations: { () -> Void in
            self.spinnerImageView.transform = CGAffineTransformMakeRotation(angle)
            }, completion: nil
        )
    }
    
    @IBAction func didPressLogIn(sender: AnyObject) {
        let vc = loginViewController
        vc.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        presentViewController(vc, animated: true, completion: nil)

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
