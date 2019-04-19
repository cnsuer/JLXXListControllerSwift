//
//  MyCollectionViewDataSource.swift
//  JLXXListControllerSwift
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 Restver. All rights reserved.
//

import UIKit

struct JLXXEventListDataSource {}

extension JLXXEventListDataSource: CollectionViewDataSourceProtocol {
	
	func cellClassNames() -> Array<JLXXCollectionView.cellType.Type> {
		return [JLXXCollectionViewNotXibCell.self]
	}
	
	func cellViewClass(for collectionView: UICollectionView, with item: Any?, at section: Int) -> JLXXCollectionView.cellType.Type {
		
		return JLXXCollectionViewNotXibCell.self
	}
	
}

struct TestCollectionViewXibDataSource {}

extension TestCollectionViewXibDataSource: CollectionViewDataSourceProtocol {
	
	func cellClassNames() -> Array<JLXXCollectionView.cellType.Type> {
		return [JLXXCollectionViewXibCell.self]
	}
	
	func cellViewClass(for collectionView: UICollectionView, with item: Any?, at section: Int) -> JLXXCollectionView.cellType.Type {
		
		return JLXXCollectionViewXibCell.self
	}
	
	func sectionHeaderViewClassNames() -> Array<JLXXCollectionView.sectionViewType.Type> {
		return [JLXXCollectionSectionHeaderView.self]
	}
	
	func sectionHeaderViewClass(for collectionView: UICollectionView, with item: Any?, at section: Int) -> JLXXCollectionView.sectionViewType.Type? {
		if section == 0 {
			return JLXXCollectionSectionHeaderView.self
		}
		return nil
	}
	
	func sectionFooterViewClassNames() -> Array<JLXXCollectionView.sectionViewType.Type> {
		return [JLXXCollectionSectionFooterView.self]
	}
	
	func sectionFooterViewClass(for collectionView: UICollectionView, with item: Any?, at section: Int) -> JLXXCollectionView.sectionViewType.Type? {
		if section == 0 {
			return JLXXCollectionSectionFooterView.self
		}
		return nil
	}
	
}


