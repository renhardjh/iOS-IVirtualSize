//
//  IVirtualWindow.swift
//  IVirtualSizeExamples
//
//  Created by RenhardJH on 27/07/23.
//

import UIKit

public final class IVirtualWindow: UIWindow {
    public override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake,
            let topViewController = topViewController,
            !(topViewController is DeviceTypeCollectionViewController) {
                topViewController.present(DeviceTypeCollectionViewController(), animated: true, completion: nil)
        }
    }
}
