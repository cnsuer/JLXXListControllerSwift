//
//  JLXXCollectionSectionHeaderView.swift
//  JinglanIM
//
//  Created by apple on 2019/3/22.
//  Copyright © 2019年 JLXX. All rights reserved.
//

import UIKit

let JLXXCollectionSectionHeaderViewHeight: CGFloat = 380

class JLXXCollectionSectionHeaderView: UICollectionReusableView, CollectionSectionViewProtocol {
	
	static var isNibSectionView: Bool {
		return true
	}
	
	static func sectionViewSize(for collectionView: UICollectionView, with item: Any?, at section: Int) -> CGSize {
		
		return CGSize(width: UIScreen.main.bounds.width, height: JLXXCollectionSectionHeaderViewHeight)
	}
	
	weak var delegate: AnyObject?
	
	@IBOutlet weak var infoView: UIView!
	@IBOutlet weak var onlineTimeLabel: UILabel!
	@IBOutlet weak var avatarImageView: UIImageView!
	@IBOutlet weak var userNameLabel: UILabel!
	@IBOutlet weak var ageButton: UIButton!
	@IBOutlet weak var unionidLabel: UILabel!
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var attentionNumberLabel: UILabel!
	@IBOutlet weak var fansNumberLabel: UILabel!
	@IBOutlet weak var eventsNumberLabel: UILabel!
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		infoView.layer.cornerRadius = 4
		infoView.layer.shadowRadius = 2
		infoView.layer.shadowOpacity = 0.1
		infoView.layer.shadowColor = UIColor.black.cgColor
		infoView.layer.shadowOffset = CGSize(width: 1, height: 3)
	}
	
	
	func setItem(item: Any?, indexPath: IndexPath) {
//		guard let model = item as? UserProfileModel else {
//			return
//		}
//		
//		avatarImageView.setImage(url: model.avatar, placeHolder: R.image.moren_1())
//		userNameLabel.text = model.user_nickname
//		locationLabel.text = model.location
//		attentionNumberLabel.text = model.following_num
//		fansNumberLabel.text = model.follower_num
//		eventsNumberLabel.text = model.moment_num
	}

}
