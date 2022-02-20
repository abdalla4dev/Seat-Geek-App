//
//  Loader.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 20/02/2022.
//


import Foundation
import UIKit

struct Loader {
    static func show() {
        LoadingOverlay.shared.showOverlay()
    }
    static func hide() {
        LoadingOverlay.shared.hideOverlayView()
    }
}

private class LoadingOverlay {
    
    var overlayView : UIView!
    var gifImageView:UIImageView!
    var containerView:UIView!
    
    var activityIndicator : UIActivityIndicatorView!
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    init() {
        self.containerView = UIView(frame: UIScreen.main.bounds)
        self.containerView.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
        
        self.overlayView = UIView()
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        overlayView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        overlayView.layer.zPosition = 1
        
        self.activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        activityIndicator.style = .whiteLarge
        activityIndicator.color = UIColor.white
        overlayView.addSubview(activityIndicator)
        
        containerView.addSubview(overlayView)
    }
    
    public func showOverlay() {
        let view = UIApplication.shared.keyWindow
        overlayView.center = (view?.center)!
        view?.addSubview(containerView)
        activityIndicator.startAnimating()
    }
    
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
}
