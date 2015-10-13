//
//  ComposeViewController.swift
//  codepath-week-04-tumblr
//
//  Created by mmuno on 10/12/15.
//  Copyright © 2015 Manuel Muñoz Solera. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    
    @IBOutlet var buttons: [UIButton]!
    
    var originalPosition = [CGPoint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPosition()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        setButtons()
        buttonsIn()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressDismiss(sender: AnyObject) {
        buttonsOut()
    }
    
    func getPosition() {
        for button in buttons {
            originalPosition.append(button.center)
        }
    }
    func setButtons() {
        for (index, button) in buttons.enumerate() {
            button.center = CGPoint(x: originalPosition[index].x, y: originalPosition[index].y + 400)
        }
    }
    
    func buttonsIn() {
        for (index, button) in buttons.enumerate() {
            let delay = 0.06 * Double(index)
            UIView.animateWithDuration(0.3, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                button.center = self.originalPosition[index]
                }, completion: nil)
        }
    }
    
    func buttonsOut() {
        for (index, button) in buttons.enumerate() {
            let delay = 0.06 * Double(index)
            UIView.animateWithDuration(0.3, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                button.center = CGPoint(x: self.originalPosition[index].x, y: self.originalPosition[index].y - 400)
                }, completion: {finished in
                    self.dismissViewControllerAnimated(true, completion: nil)
            })
        }

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
