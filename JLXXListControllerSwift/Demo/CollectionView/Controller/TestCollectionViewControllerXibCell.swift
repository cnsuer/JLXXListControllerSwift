//
//  TestCollectionViewControllerXibCell.swift
//  JLXXListControllerSwift
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 Restver. All rights reserved.
//

import UIKit

class TestCollectionViewControllerXibCell: JLXXCollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		navBarAlpha = 0
		
		collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

    }
	
	override func createDataSourceProvider() {
		let layout = UICollectionViewFlowLayout()
		
		provider = CollectionViewDataSourceProvider(dataSource: TestCollectionViewXibDataSource(), layout: layout, delegate: self)
		let sectionItem = CollectionViewSectionItem()
		sectionItem.sectionHeaderItem = "header model"
		sectionItem.sectionFooterItem = "footer model"
		sectionItem.rowItems.addObjects(from: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"])
		provider.sectionItems.append(sectionItem)
	}

}
