//
//  JLXXCollectionViewNotXibCell.swift
//  JLXXListControllerSwift
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 Restver. All rights reserved.
//

import UIKit

class JLXXCollectionViewNotXibCell: UICollectionViewCell, CollectionViewCellProtocol {
	
	static func itemSize(for collectionView: UICollectionView, with item: Any?, at indexPath: IndexPath) -> CGSize {
		return CGSize(width: UIScreen.main.bounds.width, height: 80)
	}
	
	weak var delegate: AnyObject?
	
	private let textLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)

		contentView.backgroundColor = UIColor.randomColor()

		setUpUi()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setItem(_ item: Any?, indexPath: IndexPath) {
		
		let text = item as? String
		textLabel.text = text
	}
	
	private func setUpUi() {
		contentView.addSubview(textLabel)
		textLabel.frame = CGRect(x: 20, y: 20, width: 100, height: 40)
	}
}
