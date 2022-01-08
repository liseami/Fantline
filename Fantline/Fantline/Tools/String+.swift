//
//  String+.swift
//  TimeMachine (iOS)
//
//  Created by Liseami on 2021/10/1.
//

import Foundation
import SwiftUI

//MARK: 子字符串
extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }
    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        return String(self[start...])
    }
}

//判断字符是否是中文
func stringIsChinese(str: String) -> Bool{
    let match: String = "(^[\\u4e00-\\u9fa5]+$)"
    let predicate = NSPredicate(format: "SELF matches %@", match)
    return predicate.evaluate(with: str)
}
extension String {
    func isChinese() -> Bool {
        let result = stringIsChinese(str: self)
        return result
    }
}


//MARK: 变换string为dateFormat
public func getDateFormatter(dateFormatstr : String) -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormatstr
    formatter.locale = Locale(identifier: "zh_hans_CN")
    return formatter
}




func randomString(_ length: Int?) -> String {
    let randomLengthInt = Int.random(in: 1...100)
    let letters = "宏美被他催促，為了使陰莖的頭進入尿瓶，不得不用手摸，那是又硬又熱的肉棒。這是工作，必須要做的……宏美把稍許興奮的像偶像的臉轉開，引導可怕的肉棒，豎起小手指，用三根手指輕輕握住，但立刻感到強有力的脈動，腦海裡感到一陣的麻痺，這種感覺還是第一次。奇怪，一定是先前和前輩裕子所作的事，還留在體內……宏美為快一點結束，就把勃起的肉棒拉近尿瓶口，就在此時，鐮田的身體突然移過來，想收回手時，很大的手掌用力的壓過來，宏美的手被夾在肉棒和鐮田的手掌之間，宏美不由得尖叫，這是令人難以相信的事情。"
    if length != nil {return String((0..<length!).map{ _ in letters.randomElement()! })}
    else{
        return String((0..<randomLengthInt ).map{ _ in letters.randomElement()! })
    }
}


extension LocalizedStringKey.StringInterpolation {
    mutating func appendInterpolation(bold value: LocalizedStringKey){
        appendInterpolation(Text(value).bold())
    }
    
    mutating func appendInterpolation(underline value: LocalizedStringKey){
        appendInterpolation(Text(value).underline())
    }
    
    mutating func appendInterpolation(italic value: LocalizedStringKey) {
        appendInterpolation(Text(value).italic())
    }
    
    mutating func appendInterpolation(_ value: LocalizedStringKey, color: Color?) {
        appendInterpolation(Text(value).foregroundColor(color))
    }
}
