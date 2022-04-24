//
//  userItemCell.swift
//  TatvasoftPracticalTest
//
//  Created by Dhruv Rajpurohit on 24/04/22.
//

import UIKit
import Kingfisher

class userItemCell: UICollectionViewCell {
    // MARK: - Outlet and Properties
    @IBOutlet weak var userItemImageView: UIImageView!
    
    var userItem: String? {
        didSet {
            if let userImage = userItem {
                let urlPath = URL(string: userImage)
                userItemImageView.kf.setImage(with: urlPath, placeholder: UIImage(systemName: "person.fill"), options: nil) { (result,err) in
                }
            }
        }
    }
    
}
