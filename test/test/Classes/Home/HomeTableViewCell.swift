//
//  HomeTableViewCell.swift
//  test
//
//  Created by UCL on 2022/01/02.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var vipLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var contentLabelWCons: NSLayoutConstraint!
    
    var viewModel: StatusViewModel?{
        didSet{
            let data = try? Data(contentsOf: URL(string: (viewModel?.status?.user?.profile_image_url)!)!)
            if data != nil {
                iconView.image = UIImage(data: data!)
            }
            
            screenNameLabel.text = viewModel?.status?.user?.screen_name
            
            vipLabel.text = viewModel?.vipRank
            
            timeLabel.text = viewModel?.createAtText
            
            sourceLabel.text = viewModel?.sourceText
            
            contentLabel.text = viewModel?.status?.text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentLabelWCons.constant = UIScreen.main.bounds.width - 50
    }
}
