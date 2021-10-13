//
//  UIViewExtension.swift
//  AppMpay
//
//  Created by Albert Patania on 08/08/21.
//
import Foundation
import UIKit
import Lottie

extension UIView {
    func showLoading() {
        let blurLoader = ViewLoading(frame: frame)
        self.addSubview(blurLoader)
    }

    func removeLoading() {
        if let blurLoader = subviews.first(where: { $0 is ViewLoading }) {
            blurLoader.removeFromSuperview()
        }
    }
}


class ViewLoading: UIView {

    var loadingView : UIView!
    var activityIndicator : UIActivityIndicatorView!
     var loadingAnimation : UIView!
     var fileAnimation = "loading_001"
     let animationView = AnimationView()


    override init(frame: CGRect) {
        self.loadingView = UIView()
     self.loadingAnimation = UIView()
        self.activityIndicator = UIActivityIndicatorView()

        loadingView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        loadingView.layer.backgroundColor = UIColor.black.withAlphaComponent(0.5).cgColor
     
  let animation =
            Animation.named(fileAnimation)
        animationView.animation = animation
     animationView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
     animationView.contentMode = .scaleAspectFit
    animationView.play(fromProgress: 0,
                          toProgress: 1,
                          loopMode: LottieLoopMode.loop,
                          completion: { (finished) in
                           if finished {
                             print("Animation Complete")
                           } else {
                             print("Animation cancelled")
                           }
       })
     print("Animation pass")


     self.loadingAnimation.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
     self.loadingAnimation.center = CGPoint(x: loadingView.bounds.width / 2, y: loadingView.bounds.height / 2)
     
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.center = CGPoint(x: loadingView.bounds.width / 2, y: loadingView.bounds.height / 2)
        activityIndicator.style = .whiteLarge
       // loadingView.addSubview(activityIndicator)
     
       loadingAnimation.addSubview(animationView)
       loadingView.addSubview(loadingAnimation)
      //  activityIndicator.startAnimating()
        
        super.init(frame: frame)
        addSubview(loadingView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
