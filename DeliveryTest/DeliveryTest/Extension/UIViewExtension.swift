//
//  UIViewExtension.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 6/1/2022.
//

import Foundation
import SnapKit

extension UIView {
    
    func roundCorners(cornerRadius: Double) {
      self.layer.cornerRadius = CGFloat(cornerRadius)
      self.clipsToBounds = true
    }
      
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
       let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
       let mask = CAShapeLayer()
       mask.path = path.cgPath
       self.layer.mask = mask
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { view in
            addSubview(view)
        }
    }
}
