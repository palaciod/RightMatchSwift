//
//  StackModel.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/22/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation
// StackModel should be a class since it will be mutated after refreshing
class StackModel {
    var profiles = [UserProfile]()
    
    func push(_ profile: UserProfile){
        profiles.append(profile)
    }
    func pop() -> UserProfile{
        return profiles.removeLast()
    }
    func top() -> UserProfile{
        return profiles.last!
    }
    
}


