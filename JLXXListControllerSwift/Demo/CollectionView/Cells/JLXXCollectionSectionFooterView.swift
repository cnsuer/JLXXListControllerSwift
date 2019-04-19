//
//  JLXXCollectionSectionFooterView.swift
//  JinglanIM
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019年 JLXX. All rights reserved.
//

import UIKit

private let JLXXCollectionSectionFooterViewHeight: CGFloat = 320

class JLXXCollectionSectionFooterView: UICollectionReusableView, CollectionSectionViewProtocol {
	
	static var isNibSectionView: Bool {
		return true
	}
	
	weak var delegate: AnyObject?
	
	static func sectionViewSize(for collectionView: UICollectionView, with item: Any?, at section: Int) -> CGSize {
		return CGSize(width: UIScreen.main.bounds.width, height: JLXXCollectionSectionFooterViewHeight)
	}
	
	func setItem(item: Any?, indexPath: IndexPath) {
		
	}

}
