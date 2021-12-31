//
//  VisitorView.swift
//  test
//
//  Created by UCL on 2021/12/28.
//

import UIKit

class VisitorView: UIView {

    class func visitorView() -> VisitorView{
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)?.first as! VisitorView
    }

    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var registBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    func setupVisitorViewInfo(iconName: String, tilte: String){
        iconView.image = UIImage(named: iconName)
        tipLabel.text = tilte
    }
    
    func addRotationAnimate(){
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        
        rotationAnim.fromValue = 0
        rotationAnim.toValue = Double.pi * 2
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 1
        rotationAnim.isRemovedOnCompletion = false
        
        rotationView.layer.add(rotationAnim, forKey: nil)
    }
}
