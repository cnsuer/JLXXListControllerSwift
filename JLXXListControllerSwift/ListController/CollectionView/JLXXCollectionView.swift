//
//  JLXXCollectionView.swift
//  JinglanIM
//
//  Created by apple on 2019/3/28.
//  Copyright © 2019年 JLXX. All rights reserved.
//

import UIKit

public class JLXXCollectionView: UICollectionView {

	public typealias sectionViewType = (UICollectionReusableView & CollectionSectionViewProtocol)
	public typealias cellType = (UICollectionViewCell & CollectionViewCellProtocol)
	
	internal weak var jlxxDelegate: JLXXCollectionViewProtocol?

	override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
		super.init(frame: frame, collectionViewLayout: layout)
		
		showsVerticalScrollIndicator = false
		showsHorizontalScrollIndicator = false
		keyboardDismissMode = .onDrag //UIScrollViewKeyboardDismissModeOnDrag;
		delegate = self
		
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension JLXXCollectionView: UICollectionViewDelegateFlowLayout {
	
	public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		guard let provider = collectionView.dataSource as? CollectionViewDataSourceProvider else { return CGSize.zero }
		
		let item = provider.rowItem(for: collectionView, at: indexPath)
		
		let cellClass = provider.dataSource.cellViewClass(for: collectionView, with: item, at: indexPath.section)
		let size = cellClass.itemSize(for: collectionView, with: item, at: indexPath)
		return size
	}
	
	public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		
		return getSectionViewSize(collectionView, kind: UICollectionView.elementKindSectionHeader, at: section)
	}
	
	public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		
		return getSectionViewSize(collectionView, kind: UICollectionView.elementKindSectionFooter, at: section)
	}
	
	private func getSectionViewSize(_ collectionView: UICollectionView, kind: String , at section: Int) -> CGSize {
		
		guard let provider = collectionView.dataSource as? CollectionViewDataSourceProvider else { return CGSize.zero }
		
		let sectionItem: Any?
		let sectionClass: JLXXCollectionView.sectionViewType.Type?
		if kind == UICollectionView.elementKindSectionHeader {
			sectionItem = provider.sectionItems[section].sectionHeaderItem
			sectionClass = provider.dataSource.sectionHeaderViewClass(for: collectionView, with: sectionItem, at: section)
		}else {
			sectionItem = provider.sectionItems[section].sectionFooterItem
			sectionClass = provider.dataSource.sectionFooterViewClass(for: collectionView, with: sectionItem, at: section)
		}
		
		guard let sectionViewClass = sectionClass else { return CGSize.zero }
		let size = sectionViewClass.sectionViewSize(for: collectionView, with: sectionItem, at: section)
		return size
	}
	
	public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		guard let provider = dataSource as? CollectionViewDataSourceProvider else { return }
		
		let item = provider.rowItem(for: collectionView, at: indexPath)
		jlxxDelegate?.didSelect?(for: collectionView, with: item, at: indexPath)
		collectionView.deselectItem(at: indexPath, animated: true)
	}
	
}
