//
//  extensions.swift
//  Norma4
//
//  Created by Artem Misesin on 12/4/16.
//  Copyright © 2016 Artem Misesin. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
