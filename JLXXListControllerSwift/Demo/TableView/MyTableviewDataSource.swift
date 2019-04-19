//
//  MyTableviewDataSource.swift
//  JLXXListControllerSwift
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 Restver. All rights reserved.
//

import UIKit

enum MyTableviewDataSource {
	case xib
	case notXib
}

extension MyTableviewDataSource: DataSourceProtocol {
	
	func cellClassNames() -> Array<JLXXTableView.cellType.Type> {
		switch self {
		case .notXib:
			return [JLXXTableViewNotXibCell.self]
		case .xib:
			return [JLXXTableViewXibCell.self]
		}
	}
	
	func cellViewClass(for tableView: UITableView, with item: Any?, at section: Int) -> JLXXTableView.cellType.Type {
		switch self {
		case .notXib:
			return JLXXTableViewNotXibCell.self
		case .xib:
			return JLXXTableViewXibCell.self
		}
	}
	
}



struct JLXXListDataSource {
	
	
}
