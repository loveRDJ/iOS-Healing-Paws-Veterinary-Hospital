//
//  ViewController.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/2/29.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
//class ViewController: UIViewController {
//
//    let transition = SlideinTransition()
//    var topView: UIView?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
//        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else{return}
//        menuViewController.didTapMenuType = { menuTyoe in
//            print(menuTyoe)
//            self.transitionToNew(menuTyoe)
//        }
//        menuViewController.modalPresentationStyle = .overCurrentContext
//        menuViewController.transitioningDelegate = self
//        present(menuViewController,animated: true)
//    }
//
//    func transitionToNew(_ menuType: MenuType){
//        let title = String(describing: menuType).capitalized
//        self.title = title
//
//        topView?.removeFromSuperview()
//        switch menuType {
//        case .home:
////            guard let view = self.storyboard?.instantiateInitialViewController(with) else{return}
//            let view = UIView()
//            //view.frame = self.view.bounds
//            self.view.addSubview(view)
//            self.topView = view
//        case .profile:
//            let view = UIView()
//            //view.frame = self.view.bounds
//            self.view.addSubview(view)
//            self.topView = view
//        case .appointment:
//            let view = UIView()
//            //view.frame = self.view.bounds
//            self.view.addSubview(view)
//            self.topView = view
//        case .settings:
//            let view = UIView()
//            //view.frame = self.view.bounds
//            self.view.addSubview(view)
//            self.topView = view
//        default:
//            break
//        }
//    }
//}
//
//extension ViewController: UIViewControllerTransitioningDelegate{
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.isPresenting = true
//        return transition
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.isPresenting = false
//        return transition
//    }
//}

