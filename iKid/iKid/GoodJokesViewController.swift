//
//  GoodJokesViewController.swift
//  iKid
//
//  Created by Patrick Liu on 5/4/22.
//

import UIKit

class GoodJokesViewController: UIViewController {
    
    var jokeOneQuestionViewController: GoodJokesViewControllerQuestion! = nil
    var jokeOneAnswerViewController: GoodJokesViewControllerAnswer! = nil
    
    @IBAction func switchViews(_ sender: Any) {
        print("Clicked next")
//        jokeOneBuilder()
        jokeOneQuestionBuilder()
        jokeOneAnswerBuilder()
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if jokeOneQuestionViewController != nil && jokeOneQuestionViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            jokeOneAnswerViewController.view.frame = self.view.frame
            switchViewController(jokeOneQuestionViewController, to: jokeOneAnswerViewController)
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            jokeOneQuestionViewController.view.frame = view.frame
            switchViewController(jokeOneAnswerViewController, to: jokeOneQuestionViewController)
        }
        UIView.commitAnimations()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    fileprivate func jokeOneBuilder() {
        jokeOneQuestionBuilder()
        jokeOneAnswerBuilder()
    }
    
    fileprivate func jokeOneQuestionBuilder() {
        if jokeOneQuestionViewController == nil {
            jokeOneQuestionViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "QuestionOne")
            as? GoodJokesViewControllerQuestion
        }
    }
    
    fileprivate func jokeOneAnswerBuilder() {
        if jokeOneAnswerViewController == nil {
            jokeOneAnswerViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "AnswerOne")
            as? GoodJokesViewControllerAnswer
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
