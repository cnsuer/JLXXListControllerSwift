//
//  TableView.swift
//  TTT
//
//  Created by cnsuer on 2018/8/15.
//  Copyright © 2018年 JLXX. All rights reserved.
//

import UIKit

open class JLXXTableView: UITableView {
	
	public typealias headerViewType = (UIView & TableHeaderViewProtocol)
	public typealias sectionViewType = (UIView & TableSectionViewProtocol)
	public typealias cellType = (UITableViewCell & TableViewCellProtocol)
	
	internal weak var jlxxDelegate: JLXXTableViewProtocol?
	internal weak var refreshDelegate: JLXXTableViewRefreshProtocol?
	
	private var headerView: JLXXTableView.headerViewType?
	private var sectionViews: Dictionary<String, sectionViewType> = [:]
	
	
	public override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: style)
		separatorColor = UIColor.clear
		showsVerticalScrollIndicator = false
		showsHorizontalScrollIndicator = false
		separatorStyle = .none
		keyboardDismissMode = .onDrag //UIScrollViewKeyboardDismissModeOnDrag;
		delegate = self
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	open override func reloadData() {
		guard let provider = dataSource as? DataSourceProvider else {
			
			super.reloadData()
			return
		}
		
		let headerItem = provider.headerItem

		//如果不用已存在的view
		if !provider.isUseCacheView {
			headerView = nil
		}

		if headerView == nil, let view = provider.dataSource.headerView(for: self, with: headerItem) {
			self.tableHeaderView = view
			view.delegate = provider.delegate
			headerView = view
		}
		//赋值
		if headerView != nil {
			headerView?.setItem(item: headerItem)
		}

		super.reloadData()

	}
}

extension JLXXTableView: UITableViewDelegate {
	
	public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		guard let provider = tableView.dataSource as? DataSourceProvider else { return 0 }
		let item = provider.rowItem(for: tableView, at: indexPath)
		let cellClass = provider.dataSource.cellViewClass(for: tableView, with: item, at: indexPath.section)
		let rowHeight = cellClass.rowHeight(for: tableView, with: item, at: indexPath)
		return rowHeight
	}
	
	public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		guard let provider = tableView.dataSource as? DataSourceProvider else { return 0 }
		let sectionHeaderItem = provider.sectionItems[section].sectionHeaderItem
		guard let headerViewClass = provider.dataSource.sectionHeaderViewClass(for: tableView, with: sectionHeaderItem, at: section) else { return 0 }
		return headerViewClass.sectionViewHeight(for: tableView, with: sectionHeaderItem, at: section)
	}
	
	public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		
		guard let provider = tableView.dataSource as? DataSourceProvider else { return nil }
		let sectionHeaderItem = provider.sectionItems[section].sectionHeaderItem

		let stringSection = String(section)
		if provider.isUseCacheView, let headerView = sectionViews[stringSection] {
			headerView.setItem(item: sectionHeaderItem, at: section)
			return headerView
		}
		
		if let headerView = provider.dataSource.sectionHeaderView(for: tableView, with: sectionHeaderItem, at: section){
			headerView.delegate = provider.delegate
			headerView.setItem(item: sectionHeaderItem, at: section)
			sectionViews[stringSection] = headerView
			return headerView
		} else {
			return nil
		}
	}
	
	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	
		guard let provider = dataSource as? DataSourceProvider else { return }
		
		let item = provider.rowItem(for: tableView, at: indexPath)
		jlxxDelegate?.didSelectRow?(for: tableView, with: item, at: indexPath)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	
}



