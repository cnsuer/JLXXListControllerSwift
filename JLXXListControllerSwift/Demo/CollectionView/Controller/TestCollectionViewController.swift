//
//  TestCollectionViewController.swift
//  JLXXListControllerSwift
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 Restver. All rights reserved.
//

import UIKit

class TestCollectionViewController: JLXXCollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		
    }
	
	override func createDataSourceProvider() {
		
		let layout = UICollectionViewFlowLayout()
		
		provider = CollectionViewDataSourceProvider(dataSource: JLXXEventListDataSource(), layout: layout, delegate: self)
		let sectionItem = CollectionViewSectionItem()
		sectionItem.rowItems.addObjects(from: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
		provider.sectionItems.append(sectionItem)
		
	}
	
}
