//
//  Array.swift
//  Cardx
//
//  Created by Xchel Carranza on 16/10/23.
//

import Foundation

extension Array {
    // MARK: - not used
    mutating func moveFirstToLastIndex() {
        if let firstElement = self.first {
            self.removeFirst()
            self.append(firstElement)
        }
    }
}
