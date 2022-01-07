//
//  HomeTableViewCell.swift
//  test
//
//  Created by UCL on 2022/01/02.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var vipLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var picView: PicCollectionView!
    @IBOutlet weak var retweetedLabel: UILabel!
    @IBOutlet weak var retweetedBgView: UIView!
    
    @IBOutlet weak var contentLabelWCons: NSLayoutConstraint!
    @IBOutlet weak var picViewWCons: NSLayoutConstraint!
    @IBOutlet weak var picViewHCons: NSLayoutConstraint!
    
    let edgeMargin: CGFloat = 25
    let itemMargin: CGFloat = 10
    
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
            
            let picViewSize = calclatePicViewSize(count: viewModel?.picURLs.count ?? 0)
            picViewWCons.constant = picViewSize.width
            picViewHCons.constant = picViewSize.height
            
            picView.picURLs = viewModel!.picURLs
            
            if viewModel?.status?.retweeted_status != nil {
                if let screenName = viewModel?.status?.retweeted_status?.user?.screen_name, let retweetedText = viewModel?.status?.retweeted_status?.text {
                    retweetedLabel.text = "@" + "\(screenName): " + "\(retweetedText)"
                }
                retweetedBgView.isHidden = false
            }else{
                retweetedLabel.text = nil
                retweetedBgView.isHidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentLabelWCons.constant = UIScreen.main.bounds.width - 2*edgeMargin
        
        let layout = picView.collectionViewLayout as! UICollectionViewFlowLayout
        let imageViewWH = (UIScreen.main.bounds.width - 2*edgeMargin - 2*itemMargin) / 3
        layout.itemSize = CGSize(width: imageViewWH, height: imageViewWH)
    }
}

extension HomeTableViewCell{
    private func calclatePicViewSize(count: Int) -> CGSize{
        if count == 0 {
            return CGSize.zero
        }
        
//        if count == 1{
//            SDWebImageManager.shared.imageCache.queryImage(forKey: viewModel?.picURLs.first, options: [], context: [:]) { image, data, imageCahceType in
//                <#code#>
//            }
//        }
        
        let imageViewWH = (UIScreen.main.bounds.width - 2*edgeMargin - 2*itemMargin) / 3
        
        if count == 4{
            let picViewWH = imageViewWH * 2 + itemMargin
            return CGSize(width: picViewWH, height: picViewWH)
        }
        
        let rows = CGFloat((count - 1)/3 + 1)
        let picViewH = rows * imageViewWH + (rows - 1) * itemMargin
        let picViewW = UIScreen.main.bounds.width - 2 * edgeMargin
        
        return CGSize(width: picViewW, height: picViewH)
    }
}
