//
//  ViewController.swift
//  ImageSlideShowSpike
//
//  Created by Mohamed Kelany on 6/4/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit
import ImageSlideshow

class ViewController: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    @IBOutlet weak var slideShowView: ImageSlideshow!
//    
    let localSource = [ImageSource(imageString: "photo-1")!, ImageSource(imageString: "photo-2")!, ImageSource(imageString: "photo-3")!, ImageSource(imageString: "photo-4")! ]
    
    
    @IBOutlet weak var numberOfPage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//
       
        slideShowView.zoomEnabled = true
        slideShowView.pageIndicatorPosition = .init(horizontal: .left(padding: 10), vertical: .under)
        slideShowView.contentScaleMode = UIViewContentMode.scaleAspectFill

         slideShowView.slideshowInterval = 5.0
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        slideShowView.pageIndicator = pageControl

        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideShowView.activityIndicator = DefaultActivityIndicator()
        slideShowView.currentPageChanged = { page in
//print("current page:", page)
            self.numberOfPage.text = "\(page) / \(self.localSource.count)"
        }
//
//        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideShowView.setImageInputs(localSource)

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
        slideShowView.addGestureRecognizer(recognizer)
    }
    
    @objc func didTap() {
        let fullScreenController = slideShowView.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
//


}

