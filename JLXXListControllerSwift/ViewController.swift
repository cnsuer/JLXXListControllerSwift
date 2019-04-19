//
//  ViewController.swift
//  JLXXListControllerSwift
//
//  Created by apple on 2019/4/18.
//  Copyright © 2019年 Restver. All rights reserved.
//

import UIKit

class ViewController: JLXXTableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func createDataSourceProvider() {
		provider = DataSourceProvider(dataSource: MyTableviewDataSource.notXib, delegate: self)
		let sectionItem = TableViewSectionItem()
		sectionItem.rowItems.addObjects(from: ["tableView xibCell", "collectionView", "collectionView xibCell"])
		provider.sectionItems.append(sectionItem)
	}
	
	func didSelectRow(for tableView: UITableView, with item: Any?, at indexPath: IndexPath) {
		guard let str = item as? String else { return }
		
		let controller: UIViewController
		if str == "tableView xibCell" {
			controller = TestTableViewControllerXibCell()
		}else if str == "collectionView xibCell" {
			controller = TestCollectionViewControllerXibCell()
		}else {
			controller = TestCollectionViewController()
		}
		navigationController?.pushViewController(controller, animated: true)
	}

}

