//
//  userCell.swift
//  TatvasoftPracticalTest
//
//  Created by Dhruv Rajpurohit on 24/04/22.
//

import UIKit
import Kingfisher

class userCell: UITableViewCell {
    
    // MARK: - Outlet and Properties
    @IBOutlet weak var userItemCollectionView: UICollectionView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    var arrUserItem = [String]()
    
    var userDetail: Users? {
        didSet {
            userNameLabel.text = userDetail?.name
            if let userImage = userDetail?.image{
                let urlPath = URL(string: userImage)
                userImageView.kf.setImage(with: urlPath, placeholder: UIImage(systemName: "person.fill"), options: nil) { (result,err) in
                }
            }
            
            arrUserItem = userDetail?.items ?? []
            userItemCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

// MARK: Collectionview - UICollectionViewDelegate, UICollectionViewDataSource methods
extension userCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrUserItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.userItemCollectionView.dequeueReusableCell(withReuseIdentifier: "userItemCell", for: indexPath) as? userItemCell else { return UICollectionViewCell() }
        cell.userItem = arrUserItem[indexPath.row]
        return cell
    }
    
}

extension userCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if arrUserItem.count % 2 == 0 || indexPath.row > 0 {
            return CGSize(width: screenWidth/2 - 30, height: screenWidth/2 - 30)
        }
        return CGSize(width: userItemCollectionView.bounds.self.width, height: userItemCollectionView.bounds.self.width)
        
    }
    
    
}
