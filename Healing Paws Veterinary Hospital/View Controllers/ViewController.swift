//
//  ViewController.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/2/29.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit
import Firebase
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
      
    var videoPlayerLayer:AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let db = Firestore.firestore()
 
        db.collection("wine").addDocument(data:  ["year":2017,"type": "red"]) { (err) in
            print(err.debugDescription)
        print("FIRESTORE")
        }
    }
    
   override func viewWillAppear(_ animated: Bool) {
             setUpVideo()
         }
         
         func setUpVideo(){
             //get the path to the resource in the bundle
          let bundlePath = Bundle.main.path(forResource: "video", ofType: "mp4")
          
          guard bundlePath != nil else{
              return
          }
             //create a URL from it
          let url = URL(fileURLWithPath: bundlePath!)
             //create the video player item
             let item = AVPlayerItem(url: url)
             //create the player
             videoPlayer = AVPlayer(playerItem: item)
             //create the layer
              videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
             //adjust the size and frame
          videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
          view.layer.insertSublayer(videoPlayerLayer!, at: 0)
             //add it to the view and play it
          videoPlayer?.play()
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

