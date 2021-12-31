//
//  UIBarButtonItem_Extention.swift
//  test
//
//  Created by UCL on 2021/12/28.
//

import UIKit

extension UIBarButtonItem{
    convenience init(imageName: String){
        self.init()
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        
        self.customView = btn
    }
}
