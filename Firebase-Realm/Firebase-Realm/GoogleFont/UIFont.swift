//
//  UIFont.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import Foundation
import UIKit

enum FontFamily: String{
    case InterVariableFont_wght = "Inter-VariableFont_wght"
    case InterItalicVariableFont_wght = "Inter-Italic-VariableFont_wght"
    case InterLightItalic = "Inter-LightItalic"
    case InterMedium = "Inter-Medium"
    case InterBoldItalic = "Inter-BoldItalic"
    case InterLight = "Inter-Light"
    case InterThinItalic = "Inter-ThinItalic"
    case InterExtraLight = "Inter-ExtraLight"
    case InterThin = "Inter-Thin"
    case InterBold = "Inter-Bold"
    case InterMediumItalic = "Inter-MediumItalic"
    case InterBlackItalic = "Inter-BlackItalic"
    case InterSemiBold = "Inter-SemiBold"
    case InterBlack = "Inter-Black"
    case InterExtraLightItalic = "Inter-ExtraLightItalic"
    case InterExtraBold = "Inter-ExtraBold"
    case InterRegular = "Inter-Regular"
    case InterItalic = "Inter-Italic"
    case InterSemiBoldItalic = "Inter-SemiBoldItalic"
    case InterExtraBoldItalic = "Inter-ExtraBoldItalic"
}

func customFont(size: CGFloat, font: FontFamily) -> UIFont {
    guard let customFont = UIFont(name: font.rawValue, size: size) else {
        return UIFont.systemFont(ofSize: size)
    }
    return customFont
}

