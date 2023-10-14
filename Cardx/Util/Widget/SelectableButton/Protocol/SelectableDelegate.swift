//
//  SelectableDelegate.swift
//  Switching Button
//
//  Created by Xchel Carranza on 29/12/22.
//

protocol SelectableDelegate: AnyObject {
    associatedtype T
    func onSelected(data: T, selectableButton: SelectableButton)
}
