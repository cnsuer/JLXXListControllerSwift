//
//  JLXXTableViewNotXibCell.swift
//  JLXXListControllerSwift
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 Restver. All rights reserved.
//

import UIKit

class JLXXTableViewNotXibCell: UITableViewCell, TableViewCellProtocol {
	
	static func rowHeight(for tableView: UITableView, with item: Any?, at indexPath: IndexPath) -> CGFloat {
		return 80.0
	}
	
	weak var delegate: AnyObject?
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.backgroundColor = UIColor.randomColor()
		textLabel?.backgroundColor = .clear
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setItem(item: Any?, indexPath: IndexPath) {
		
		guard let str = item as? String else { return }
		
		
		textLabel?.text = str
		
	}
	
}
