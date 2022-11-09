//
//  String+Utils.swift
//  Dizcarta
//
//  Created by Igor Samoel da Silva on 03/11/22.
//

import Foundation

extension String {
      var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
      }
}

extension Optional where Wrapped == String {
  var isBlank: Bool {
    return self?.isBlank ?? true
  }
}
