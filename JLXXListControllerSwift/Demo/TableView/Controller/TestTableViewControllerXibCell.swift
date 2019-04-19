//
//  TestViewController.swift
//  JLXXListControllerSwift
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 Restver. All rights reserved.
//

import UIKit

class TestTableViewControllerXibCell: JLXXTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		navBarColor = .cyan
    }
	
	override func createDataSourceProvider() {
		provider = DataSourceProvider(dataSource: MyTableviewDataSource.xib, delegate: self)
		let sectionItem = TableViewSectionItem()
		sectionItem.rowItems.addObjects(from: ["1", "2", "3", "4", "5", "6", "7", "8"])
		provider.sectionItems.append(sectionItem)
	}

}

extension TestTableViewControllerXibCell: JLXXTableViewXibCellDelegate {
	
	func jlxxTableViewXibCellClickFollow(_ cell: JLXXTableViewXibCell, with message: String) {
		print("sssssssssssss")
	}
	
}
