//
//  UIWindow+Ext.swift
//  IVirtualSizeExamples
//
//  Created by RenhardJH on 27/07/23.
//

import UIKit

extension UIWindow {
    var topViewController: UIViewController? {
        if let presented = rootViewController?.presentedViewController {
            return presented
        } else if let nav = rootViewController as? UINavigationController {
            return nav.visibleViewController
        } else if let tab = rootViewController as? UITabBarController {
            return tab.selectedViewController
        } else {
            return rootViewController
        }
    }
}
