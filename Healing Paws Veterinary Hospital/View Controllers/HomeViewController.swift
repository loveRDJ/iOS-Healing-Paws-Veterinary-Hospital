//
//  HomeViewController.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/3/3.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var cView1: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var cView: UICollectionView!
    
    
    var imageArr = [UIImage(named: "5"), UIImage(named: "5"), UIImage(named: "5"), UIImage(named: "5"), UIImage(named: "5")]
    
    var imageArr2 = [UIImage(named: "h"), UIImage(named: "doctor"), UIImage(named: "profile"), UIImage(named: "appointment"), UIImage(named: "make"), UIImage(named: "chat"), UIImage(named: "setting")]
    
    var labelArr = ["Home", "Veterinarians", "Profile", "Appointments", "Make an appointment", "Chat", "Settings"]
    
    var currentIndex = 0
    var timer:Timer?
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction(){
        
        let desiredScrollPosition = (currentIndex < imageArr.count - 1) ? currentIndex + 1 : 0
        cView1.scrollToItem(at: IndexPath(item: desiredScrollPosition, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBOutlet weak var pageView: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = imageArr.count
        startTimer()
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cView1{
            return imageArr.count
        }else{
            return 7
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cView1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
            cell.image = imageArr[indexPath.item]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! FunctionCollectionViewCell
            cell.image = imageArr2[indexPath.item]
            cell.label.text = labelArr[indexPath.item]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == cView1{
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else{
            return CGSize(width: collectionView.frame.width / 3.5, height: collectionView.frame.height / 3.5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == cView{
            if indexPath.item == 1{
                let vc = storyboard?.instantiateViewController(identifier: "Doctors") as? DoctorsViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else if indexPath.item == 2{
                let vc = storyboard?.instantiateViewController(identifier: "Profile") as? ProfileViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else if indexPath.item == 3{
                let vc = storyboard?.instantiateViewController(identifier: "Appointment") as? AppointmentViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else if indexPath.item == 4{
                let vc = storyboard?.instantiateViewController(identifier: "Make") as? MakeViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            }
                else if indexPath.item == 5{
                    let vc = storyboard?.instantiateViewController(identifier: "Chat") as? ChatViewController
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
            else if indexPath.item == 6{
                let vc = storyboard?.instantiateViewController(identifier: "Settings") as? SettingViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / cView1.frame.size.width)
        pageControl.currentPage = currentIndex
    }
    
}
