//
//  IVirtualWindow.swift
//  IVirtualSizeExamples
//
//  Created by RenhardJH on 27/07/23.
//

import UIKit

final class IVirtualWindow: UIWindow {
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake,
            let topViewController = topViewController,
            !(topViewController is DeviceTypeCollectionViewController) {
                topViewController.present(DeviceTypeCollectionViewController(), animated: true, completion: nil)
        }
    }
}
