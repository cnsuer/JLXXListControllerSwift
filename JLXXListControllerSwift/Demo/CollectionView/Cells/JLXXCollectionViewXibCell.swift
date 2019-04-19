//
//  JLXXCollectionViewXibCell.swift
//  JLXXListControllerSwift
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 Restver. All rights reserved.
//

import UIKit

class JLXXCollectionViewXibCell: UICollectionViewCell, CollectionViewCellProtocol {
	
	static var isNibCell: Bool {
		return true
	}
	
	static func itemSize(for collectionView: UICollectionView, with item: Any?, at indexPath: IndexPath) -> CGSize {
		return CGSize(width: 80, height: 80)
	}
	
	weak var delegate: AnyObject?
	
	@IBOutlet weak var textLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()

		contentView.backgroundColor = UIColor.randomColor()

	}

	
	func setItem(_ item: Any?, indexPath: IndexPath) {
		
		textLabel.text = item as? String
		
	}
	
}
