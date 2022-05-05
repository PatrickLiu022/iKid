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
    var jokeTwoQuestionViewController: GoodJokesTwoViewControllerQuestion! = nil
    var jokeTwoAnswerViewController: GoodJokesTwoViewControllerAnswer! = nil
    var jokeThreeQuestionViewController: GoodJokeThreeViewControllerQuestion! = nil
    var jokeThreeAnswerViewController: GoodJokeThreeViewControllerAnswer! = nil
    
    @IBOutlet weak var goodJokesLabel: UILabel!
    @IBOutlet weak var toolBarButton: UIToolbar!
    
    @IBAction func switchViews(_ sender: Any) {
        goodJokesLabel.isHidden = true
        jokeOneBuilder()
        jokeTwoBuilder()
        jokeThreeBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if jokeOneQuestionViewController != nil && jokeOneQuestionViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            jokeOneAnswerViewController.view.frame = self.view.frame
            switchViewController(jokeOneQuestionViewController, to: jokeOneAnswerViewController)
        } else if jokeOneAnswerViewController != nil && jokeOneAnswerViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            jokeTwoQuestionViewController.view.frame = self.view.frame
            switchViewController(jokeOneAnswerViewController, to: jokeTwoQuestionViewController)
        } else if jokeTwoQuestionViewController != nil && jokeTwoQuestionViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            jokeTwoAnswerViewController.view.frame = self.view.frame
            switchViewController(jokeTwoQuestionViewController, to: jokeTwoAnswerViewController)
        } else if jokeTwoAnswerViewController != nil && jokeTwoAnswerViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            jokeThreeQuestionViewController.view.frame = self.view.frame
            switchViewController(jokeTwoAnswerViewController, to: jokeThreeQuestionViewController)
        } else if jokeThreeQuestionViewController != nil && jokeThreeQuestionViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            jokeThreeAnswerViewController.view.frame = self.view.frame
            switchViewController(jokeThreeQuestionViewController, to: jokeThreeAnswerViewController)
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            jokeOneQuestionViewController.view.frame = self.view.frame
            switchViewController(jokeThreeAnswerViewController, to: jokeOneQuestionViewController)
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
    
    fileprivate func jokeTwoBuilder() {
        jokeTwoQuestionBuilder()
        jokeTwoAnswerBuilder()
    }
    
    fileprivate func jokeThreeBuilder() {
        jokeThreeQuestionBuilder()
        jokeThreeAnswerBuilder()
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
    
    fileprivate func jokeTwoQuestionBuilder() {
        if jokeTwoQuestionViewController == nil {
            jokeTwoQuestionViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "QuestionTwo")
            as? GoodJokesTwoViewControllerQuestion
        }
    }
    
    fileprivate func jokeTwoAnswerBuilder() {
        if jokeTwoAnswerViewController == nil {
            jokeTwoAnswerViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "AnswerTwo")
            as? GoodJokesTwoViewControllerAnswer
        }
    }
    
    fileprivate func jokeThreeQuestionBuilder() {
        if jokeThreeQuestionViewController == nil {
            jokeThreeQuestionViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "QuestionThree")
            as? GoodJokeThreeViewControllerQuestion
        }
    }
    
    fileprivate func jokeThreeAnswerBuilder() {
        if jokeThreeAnswerViewController == nil {
            jokeThreeAnswerViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "AnswerThree")
            as? GoodJokeThreeViewControllerAnswer
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
