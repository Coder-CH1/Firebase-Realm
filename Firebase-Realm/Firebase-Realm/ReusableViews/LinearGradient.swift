//
//  LinearGradient.swift
//  Firebase-Realm
//
//  Created by Mac on 17/05/2023.
//

import UIKit

class GradientColor {
    static func linearGradientColor(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint, size: CGSize) -> UIColor {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        defer { UIGraphicsEndImageContext() }

        guard let context = UIGraphicsGetCurrentContext() else {
            return UIColor.clear
        }

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let cgColors = colors.map { $0.cgColor } as CFArray

        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: cgColors, locations: nil) else {
            return UIColor.clear
        }

        context.drawLinearGradient(
            gradient,
            start: CGPoint(x: size.width * startPoint.x, y: size.height * startPoint.y),
            end: CGPoint(x: size.width * endPoint.x, y: size.height * endPoint.y),
            options: []
        )

        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIColor.clear
        }

        return UIColor(patternImage: image)
    }
}

let gradientColor = GradientColor.linearGradientColor(
    colors: [UIColor.red, UIColor.blue],
    startPoint: CGPoint(x: 0, y: 0),
    endPoint: CGPoint(x: 1, y: 1),
    size: CGSize(width: 200, height: 200)
)


