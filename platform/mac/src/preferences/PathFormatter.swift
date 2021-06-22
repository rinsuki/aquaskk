//
//  PathFormatter.swift
//  AquaSKKPreferences
//
//  Created by user on 2021/06/22.
//

import Foundation

@objc(PathFormatter)
class PathFormatter: Formatter {
    override func string(for obj: Any?) -> String? {
        guard let string = obj as? NSString else {
            return nil
        }
        return string.abbreviatingWithTildeInPath
    }
    
    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = string as NSString
        return true
    }
    
    override func attributedString(for obj: Any, withDefaultAttributes attrs: [NSAttributedString.Key : Any]? = nil) -> NSAttributedString? {
        guard let string = obj as? String else {
            return nil
        }
        return .init(string: string, attributes: attrs)
    }
}
