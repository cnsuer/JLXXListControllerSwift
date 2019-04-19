//
//  UIColor+Extension.swift
//  JLXXListControllerSwift
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 Restver. All rights reserved.
//

import UIKit

extension UIColor {
	//在Extension中给系统的类扩展构造函数,只能扩充'便利构造函数'
	convenience init(r: CGFloat, g: CGFloat, b: CGFloat ,alpha : CGFloat = 1.0) {
		self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
	}
	
	convenience init (_ hexString: String, alpha: CGFloat = 1.0) {
		//删除字符串中的空格,并转换为大写
		var string = hexString.trimmingCharacters(in: NSCharacterSet.whitespaces).uppercased()
		// String should be 6 or 8 characters
		if string.count < 6 {
			string = "#FFFFFF"
		}
		// strip 0X if it appears
		//如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
		if string.hasPrefix("0X") {
			let nsstring = string as NSString
			string = nsstring.substring(from: 2)
		}
			//如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
		else if string.hasPrefix("#") {
			let nsstring = string as NSString
			string = nsstring.substring(from: 1)
		}
		
		if string.count != 6 {
			string = "#FFFFFF"
		}
		// Separate into r, g, b substrings
		var range = NSRange(location: 0, length: 2)
		let nsstring = string as NSString
		
		//r
		let rString = nsstring.substring(with: range)
		//g
		range.location = 2
		let gString = nsstring.substring(with: range)
		//b
		range.location = 4
		let bString = nsstring.substring(with: range)
		//		// Scan values
		var r: UInt64 = 0
		Scanner(string: rString).scanHexInt64(&r)
		var g: UInt64 = 0
		Scanner(string: gString).scanHexInt64(&g)
		var b: UInt64 = 0
		Scanner(string: bString).scanHexInt64(&b)
		
		self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
	}
	
	public class func randomColor() -> UIColor{
		
		return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
	}
	
	public class func getRGBDelta(_ firstColor : UIColor, _ secondColor : UIColor) -> (CGFloat, CGFloat,  CGFloat) {
		let firstRGB = firstColor.getRGB()
		let secondRGB = secondColor.getRGB()
		
		return (firstRGB.0 - secondRGB.0, firstRGB.1 - secondRGB.1, firstRGB.2 - secondRGB.2)
	}
	
	public func getRGB() -> (CGFloat, CGFloat, CGFloat) {
		
		guard let components = cgColor.components else {
			fatalError("保证普通颜色是RGB方式传入")
		}
		return (components[0] * 255.0,components[1] * 255.0, components[2] * 255.0)
	}
}
