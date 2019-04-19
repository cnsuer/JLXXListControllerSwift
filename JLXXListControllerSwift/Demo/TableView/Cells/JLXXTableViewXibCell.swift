//
//  JLXXTableViewXibCell.swift
//  JLXXListControllerSwift
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 Restver. All rights reserved.
//

import UIKit

protocol JLXXTableViewXibCellDelegate: class {
	func jlxxTableViewXibCellClickFollow(_ cell: JLXXTableViewXibCell, with message: String) -> Void
}

class JLXXTableViewXibCell: UITableViewCell, TableViewCellProtocol {
	
	static var isNibCell: Bool {
		return true
	}
	
	static func rowHeight(for tableView: UITableView, with item: Any?, at indexPath: IndexPath) -> CGFloat {
		
		return 80.0
		
	}
	
	weak var delegate: AnyObject?
	weak var xibCellDelegate: JLXXTableViewXibCellDelegate? {
		return delegate as? JLXXTableViewXibCellDelegate
	}
	
	@IBOutlet weak var avatarImageView: UIImageView!
	@IBOutlet weak var lastMessageLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		
	}
	
	func setItem(item: Any?, indexPath: IndexPath) {
		guard let str = item as? String else { return }
		
		lastMessageLabel.text = str
	}
	
	@IBAction func followButtonClick(_ sender: Any) {
		xibCellDelegate?.jlxxTableViewXibCellClickFollow(self, with: "1111")
	}
	
}
