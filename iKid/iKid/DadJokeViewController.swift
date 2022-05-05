//
//  DadJokeViewController.swift
//  iKid
//
//  Created by Patrick Liu on 5/5/22.
//

import UIKit

class DadJokeViewController: UIViewController {
    
    var dadOneQuestionViewController: DadJokeOneQuestionViewController! = nil
    var dadOneAnswerViewController: DadJokeOneAnswerViewController! = nil
    var dadTwoQuestionViewController: DadJokeTwoQuestionViewController! = nil
    var dadTwoAnswerViewController: DadJokeTwoAnswerViewController! = nil
    var dadThreeQuestionViewController: DadJokeThreeQuestionViewController! = nil
    var dadThreeAnswerViewController: DadJokeThreeAnswerViewController! = nil

    @IBOutlet weak var dadJokeTitle: UILabel!
    
    @IBAction func switchViews(_ sender: Any) {
        dadJokeTitle.isHidden = true
        dadOneBuilder()
        dadTwoBuilder()
        dadThreeBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if dadOneQuestionViewController != nil && dadOneQuestionViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dadOneAnswerViewController.view.frame = self.view.frame
            switchViewController(dadOneQuestionViewController, to: dadOneAnswerViewController)
        } else if dadOneAnswerViewController != nil && dadOneAnswerViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dadTwoQuestionViewController.view.frame = self.view.frame
            switchViewController(dadOneAnswerViewController, to: dadTwoQuestionViewController)
        } else if dadTwoQuestionViewController != nil && dadTwoQuestionViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dadTwoAnswerViewController.view.frame = self.view.frame
            switchViewController(dadTwoQuestionViewController, to: dadTwoAnswerViewController)
        } else if dadTwoAnswerViewController != nil && dadTwoAnswerViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dadThreeQuestionViewController.view.frame = self.view.frame
            switchViewController(dadTwoAnswerViewController, to: dadThreeQuestionViewController)
        } else if dadThreeQuestionViewController != nil && dadThreeQuestionViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dadThreeAnswerViewController.view.frame = super.view.frame
            switchViewController(dadThreeQuestionViewController, to: dadThreeAnswerViewController)
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dadOneQuestionViewController.view.frame = super.view.frame
            switchViewController(dadThreeAnswerViewController, to: dadOneQuestionViewController)
        }
        
        
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }
    
    fileprivate func dadOneBuilder() {
        dadOneQuestionBuilder()
        dadOneAnswerBuilder()
    }
    
    fileprivate func dadTwoBuilder() {
        dadTwoQuestionBuilder()
        dadTwoAnswerBuilder()
    }
    
    fileprivate func dadThreeBuilder() {
        dadThreeQuestionBuilder()
        dadThreeAnswerBuilder()
    }
    
    fileprivate func dadOneQuestionBuilder() {
        if dadOneQuestionViewController == nil {
            dadOneQuestionViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "dadQuestionOne")
            as? DadJokeOneQuestionViewController
        }
    }
    
    fileprivate func dadOneAnswerBuilder() {
        if dadOneAnswerViewController == nil {
            dadOneAnswerViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "dadAnswerOne")
            as? DadJokeOneAnswerViewController
        }
    }
    
    fileprivate func dadTwoQuestionBuilder() {
        if dadTwoQuestionViewController == nil {
            dadTwoQuestionViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "dadQuestionTwo")
            as? DadJokeTwoQuestionViewController
        }
    }
    
    fileprivate func dadTwoAnswerBuilder() {
        if dadTwoAnswerViewController == nil {
            dadTwoAnswerViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "dadAnswerTwo")
            as? DadJokeTwoAnswerViewController
        }
    }
    
    fileprivate func dadThreeQuestionBuilder() {
        if dadThreeQuestionViewController == nil {
            dadThreeQuestionViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "dadQuestionThree")
            as? DadJokeThreeQuestionViewController
        }
    }
    
    fileprivate func dadThreeAnswerBuilder() {
        if dadThreeAnswerViewController == nil {
            dadThreeAnswerViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "dadAnswerThree")
            as? DadJokeThreeAnswerViewController
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
