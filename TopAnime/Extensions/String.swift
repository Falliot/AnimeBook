//
//  String.swift
//  TopAnime
//
//  Created by Anton on 10/5/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation
//Java subString
extension String {
    func subString(from: Int, to: Int) -> String {
       let startIndex = self.index(self.startIndex, offsetBy: from)
       let endIndex = self.index(self.startIndex, offsetBy: to)
       return String(self[startIndex...endIndex])
    }
}

