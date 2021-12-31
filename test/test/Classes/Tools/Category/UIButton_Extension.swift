//
//  UIButton_Extension.swift
//  test
//
//  Created by UCL on 2021/12/26.
//

import UIKit

extension UIButton{
    convenience init(imageName: String,bgImageName: String){
        self.init()
        
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
//        setImage(UIImage(named: bgImageName), for: .normal)
//        setImage(UIImage(named: bgImageName + "_highlighted"), for: .highlighted)
        
        sizeToFit()
    }
}
