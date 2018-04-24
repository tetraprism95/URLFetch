//
//  Extensions.swift
//  URLFetch
//
//  Created by Nuri Chun on 4/23/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import UIKit

extension UIView
{
    func anchor(top: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                right: NSLayoutXAxisAnchor?,
                padTop: CGFloat,
                padLeft: CGFloat,
                padBottom: CGFloat,
                padRight: CGFloat,
                width: CGFloat,
                height: CGFloat)
    {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top
        {
            self.topAnchor.constraint(equalTo: top, constant: padTop).isActive = true
        }
        
        if let left = left
        {
            self.leftAnchor.constraint(equalTo: left, constant: padLeft).isActive = true
        }
        
        if let bottom = bottom
        {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -padBottom).isActive = true
        }
        
        if let right = right
        {
            self.rightAnchor.constraint(equalTo: right, constant: -padRight).isActive = true
        }
        
        if width != 0
        {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0
        {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
}

