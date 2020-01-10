//
//  ItemStack.swift
//  RightMatch
//
//  Created by Daniel Palacio on 10/15/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation
class ItemStack {
    var items = [Any]()
    
    func push(_ item: Any){
        items.append(item)
    }
    func pop() -> Any{
        return items.removeFirst()
    }
    func top() -> Any{
        return items.first!
    }
    func size() -> Int{
        return items.count
    }
    func getItem(at index: Int) -> Any{
        return items[index]
    }
}
