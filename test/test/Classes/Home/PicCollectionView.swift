//
//  PicCollectionView.swift
//  test
//
//  Created by UCL on 2022/01/03.
//

import UIKit
import SDWebImage

class PicCollectionView: UICollectionView {
    
    var picURLs: [NSURL] = [NSURL](){
        didSet{
            self.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataSource = self
    }
}

extension PicCollectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PicCell", for: indexPath) as! PicCollectionViewCell
        cell.picURL = picURLs[indexPath.item]
        return cell
    }
}

class PicCollectionViewCell: UICollectionViewCell{
    
    var picURL: NSURL? {
        didSet{
            guard  let picURL = picURL else {
                return
            }
            var urlString = picURL.absoluteString!
            let index = urlString.index(urlString.startIndex, offsetBy: 4)
            urlString.insert("s", at: index)
            iconView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "me"), options: [], context: [:])
        }
    }
    
    @IBOutlet weak var iconView: UIImageView!
}
