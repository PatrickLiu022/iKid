//
//  PunJokeViewController.swift
//  iKid
//
//  Created by Patrick Liu on 5/4/22.
//

import UIKit

class PunJokeViewController: UIViewController {
    
    var punOneQuestionViewController: PunJokeOneQuestionViewController! = nil
    var punOneAnswerViewController: PunJokeOneAnswerViewController! = nil
    var punTwoQuestionViewController: PunJokeTwoQuestionViewController! = nil
    var punTwoAnswerViewController: PunJokeTwoAnswerViewController! = nil
    var punThreeQuestionViewController: PunJokeThreeQuestionViewController! = nil
    var punThreeAnswerViewController: PunJokeThreeAnswerViewController! = nil
    
    @IBOutlet weak var punTitle: UILabel!
    
    @IBAction func switchViews(_ sender: Any) {
        punTitle.isHidden = true
        punOneBuilder()
        punTwoBuilder()
        punThreeBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if punOneQuestionViewController != nil && punOneQuestionViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punOneAnswerViewController.view.frame = self.view.frame
            switchViewController(punOneQuestionViewController, to: punOneAnswerViewController)
        } else if punOneAnswerViewController != nil && punOneAnswerViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punTwoQuestionViewController.view.frame = self.view.frame
            switchViewController(punOneAnswerViewController, to: punTwoQuestionViewController)
        } else if punTwoQuestionViewController != nil && punTwoQuestionViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punTwoAnswerViewController.view.frame = self.view.frame
            switchViewController(punTwoQuestionViewController, to: punTwoAnswerViewController)
        } else if punTwoAnswerViewController != nil && punTwoAnswerViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punThreeQuestionViewController.view.frame = self.view.frame
            switchViewController(punTwoAnswerViewController, to: punThreeQuestionViewController)
        } else if punThreeQuestionViewController != nil && punThreeQuestionViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punThreeAnswerViewController.view.frame = super.view.frame
            switchViewController(punThreeQuestionViewController, to: punThreeAnswerViewController)
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punOneQuestionViewController.view.frame = super.view.frame
            switchViewController(punThreeAnswerViewController, to: punOneQuestionViewController)
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
    
    fileprivate func punOneBuilder() {
        punOneQuestionBuilder()
        punOneAnswerBuilder()
    }
    
    fileprivate func punTwoBuilder() {
        punTwoQuestionBuilder()
        punTwoAnswerBuilder()
    }
    
    fileprivate func punThreeBuilder() {
        punThreeQuestionBuilder()
        punThreeAnswerBuilder()
    }
    
    fileprivate func punOneQuestionBuilder() {
        if punOneQuestionViewController == nil {
            punOneQuestionViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "PunQuestionOne")
            as? PunJokeOneQuestionViewController
        }
    }
    
    fileprivate func punOneAnswerBuilder() {
        if punOneAnswerViewController == nil {
            punOneAnswerViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "PunAnswerOne")
            as? PunJokeOneAnswerViewController
        }
    }
    
    fileprivate func punTwoQuestionBuilder() {
        if punTwoQuestionViewController == nil {
            punTwoQuestionViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "PunQuestionTwo")
            as? PunJokeTwoQuestionViewController
        }
    }
    
    fileprivate func punTwoAnswerBuilder() {
        if punTwoAnswerViewController == nil {
            punTwoAnswerViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "PunAnswerTwo")
            as? PunJokeTwoAnswerViewController
        }
    }
    
    fileprivate func punThreeQuestionBuilder() {
        if punThreeQuestionViewController == nil {
            punThreeQuestionViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "PunQuestionThree")
            as? PunJokeThreeQuestionViewController
        }
    }
    
    fileprivate func punThreeAnswerBuilder() {
        if punThreeAnswerViewController == nil {
            punThreeAnswerViewController =
                storyboard?
                .instantiateViewController(withIdentifier: "PunAnswerThree")
            as? PunJokeThreeAnswerViewController
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
