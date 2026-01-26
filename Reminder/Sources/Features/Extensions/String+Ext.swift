//
//  String+Ext.swift
//  Reminder
//
//  Created by Ronan Fernandes on 26/01/26.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
