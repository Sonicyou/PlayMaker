//
//  UIView+Extension.swift
//  PlayMaker
//
//  Created by Артем Фролов on 29.07.2021.
//

import UIKit

extension UIView {
    func setupShadow(opacity: Float, offset: CGSize, radius: CGFloat, color: CGColor?) {
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowColor = color
    }
}
