//
//  BaseViewController.swift
//  Weather
//
//  Created by Dileep M on 06/06/21.
//

import UIKit

class BaseViewController: UIViewController {

    var activityView: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Convenience Methods
    // MARK: Activity Indicator
    func toggleActivityWith(toggleValue: Bool) {
        toggleValue ? startActivity() : stopActivity()
    }
    
    // MARK: Private Methods
    
    // MARK: Activity Indicator
    private func startActivity() {
        // Check if activity View is already being displayed
        guard activityView == nil else {
            return
        }
        let opacity: CGFloat =  0.4
        view.endEditing(true)
        activityView = UIView()
        activityView?.translatesAutoresizingMaskIntoConstraints = false
        activityView?.backgroundColor = UIColor.white.withAlphaComponent(opacity)
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.activityView!)
        activityView?.addSubview(activityIndicator)
        
        // Forced unwrapping is safe here, as activityView Nil check is already done in the top
        activityIndicator.centerXAnchor.constraint(equalTo: activityView!.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: activityView!.centerYAnchor).isActive = true
        
        activityView?.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        activityView?.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        activityView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        activityView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    
        activityIndicator.startAnimating()
    }
    
    private func stopActivity() {
        self.activityView?.removeFromSuperview()
        self.activityView = nil
    }

}
