//
//  Device.swift
//  IVirtualSizeExamples
//
//  Created by RenhardJH on 27/07/23.
//

import Foundation

enum IDeviceType: CaseIterable {
    case iPhone5
    case iPhone6
    case iPhone6s
    case iPhone6Plus
    case iPhone6sPlus
    case iPhoneSE
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPhoneXR
    case iPhoneXS
    case iPhoneXSMax
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax
    case iPhoneSE2ndGen
    case iPhone12Mini
    case iPhone12
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone13Mini
    case iPhone13
    case iPhone13Pro
    case iPhone13ProMax
    case iPhone14
    case iPhone14Plus
    case iPhone14Pro
    case iPhone14ProMax

    var size: CGSize {
        switch self {
        case .iPhone5:          return CGSize(width: 320, height: 568)
        case .iPhone6:          return CGSize(width: 375, height: 667)
        case .iPhone6s:         return CGSize(width: 375, height: 667)
        case .iPhone6Plus:      return CGSize(width: 414, height: 736)
        case .iPhone6sPlus:     return CGSize(width: 414, height: 736)
        case .iPhoneSE:         return CGSize(width: 320, height: 568)
        case .iPhone7:          return CGSize(width: 375, height: 667)
        case .iPhone7Plus:      return CGSize(width: 414, height: 736)
        case .iPhone8:          return CGSize(width: 375, height: 667)
        case .iPhone8Plus:      return CGSize(width: 414, height: 736)
        case .iPhoneX:          return CGSize(width: 375, height: 812)
        case .iPhoneXR:         return CGSize(width: 414, height: 896)
        case .iPhoneXS:         return CGSize(width: 375, height: 812)
        case .iPhoneXSMax:      return CGSize(width: 414, height: 896)
        case .iPhone11:         return CGSize(width: 414, height: 896)
        case .iPhone11Pro:      return CGSize(width: 375, height: 812)
        case .iPhone11ProMax:   return CGSize(width: 414, height: 896)
        case .iPhoneSE2ndGen:   return CGSize(width: 375, height: 667)
        case .iPhone12Mini:     return CGSize(width: 375, height: 812)
        case .iPhone12:         return CGSize(width: 390, height: 844)
        case .iPhone12Pro:      return CGSize(width: 390, height: 844)
        case .iPhone12ProMax:   return CGSize(width: 428, height: 926)
        case .iPhone13Mini:     return CGSize(width: 375, height: 812)
        case .iPhone13:         return CGSize(width: 390, height: 844)
        case .iPhone13Pro:      return CGSize(width: 390, height: 844)
        case .iPhone13ProMax:   return CGSize(width: 428, height: 926)
        case .iPhone14:         return CGSize(width: 390, height: 844)
        case .iPhone14Plus:     return CGSize(width: 428, height: 926)
        case .iPhone14Pro:      return CGSize(width: 393, height: 852)
        case .iPhone14ProMax:   return CGSize(width: 430, height: 932)
        }
    }

    var title: String {
        switch self {
        case .iPhone5:          return "iPhone 5"
        case .iPhone6:          return "iPhone 6"
        case .iPhone6s:         return "iPhone 6s"
        case .iPhone6Plus:      return "iPhone 6 Plus"
        case .iPhone6sPlus:     return "iPhone 6s Plus"
        case .iPhoneSE:         return "iPhone SE"
        case .iPhone7:          return "iPhone 7"
        case .iPhone7Plus:      return "iPhone 7 Plus"
        case .iPhone8:          return "iPhone 8"
        case .iPhone8Plus:      return "iPhone 8 Plus"
        case .iPhoneX:          return "iPhone X"
        case .iPhoneXR:         return "iPhone XR"
        case .iPhoneXS:         return "iPhone XS"
        case .iPhoneXSMax:      return "iPhone XS Max"
        case .iPhone11:         return "iPhone 11"
        case .iPhone11Pro:      return "iPhone 11 Pro"
        case .iPhone11ProMax:   return "iPhone 11 Pro Max"
        case .iPhoneSE2ndGen:   return "iPhone SE 2nd Gen"
        case .iPhone12Mini:     return "iPhone 12 Mini"
        case .iPhone12:         return "iPhone 12"
        case .iPhone12Pro:      return "iPhone 12 Pro"
        case .iPhone12ProMax:   return "iPhone 12 Pro Max"
        case .iPhone13Mini:     return "iPhone 13 Mini"
        case .iPhone13:         return "iPhone 13"
        case .iPhone13Pro:      return "iPhone 13 Mini"
        case .iPhone13ProMax:   return "iPhone 13 Pro Max"
        case .iPhone14:         return "iPhone 14"
        case .iPhone14Plus:     return "iPhone 14 Plus"
        case .iPhone14Pro:      return "iPhone 14 Pro"
        case .iPhone14ProMax:   return "iPhone 14 Pro Max"
        }
    }
}
