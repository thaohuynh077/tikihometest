//
//  IHotItemsProcessor.swift
//  Demo
//
//  Created by admin on 3/2/19.
//

import Foundation

protocol IHotItemsProcessor {
    func getItems(callback: @escaping (Bool, ArrayResponse) -> Void)
}
