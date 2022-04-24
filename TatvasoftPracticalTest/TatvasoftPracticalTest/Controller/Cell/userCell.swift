//
//  userCell.swift
//  TatvasoftPracticalTest
//
//  Created by Dhruv Rajpurohit on 24/04/22.
//

import UIKit

class userCell: UITableViewCell {

    // MARK: - Outlet and Properties
    @IBOutlet weak var userItemCollectionView: UICollectionView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.userItemCollectionView.dequeueReusableCell(withReuseIdentifier: "userItemCell", for: indexPath) as? userItemCell else { return UICollectionViewCell() }
            return cell
    }
    
    
}
