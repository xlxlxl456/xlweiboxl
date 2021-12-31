//
//  TitleButton.swift
//  test
//
//  Created by UCL on 2021/12/28.
//

import UIKit

class TitleButton: UIButton{
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setImage(UIImage(named: "arrow-up"), for: .normal)
        setImage(UIImage(named: "arrow-down"), for: .selected)
        setTitle("xlsan", for: .normal)
        setTitleColor(UIColor.black, for: .normal)
        sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel!.frame.origin.x = 0
        imageView!.frame.origin.x = titleLabel!.frame.size.width + 5
    }
}
