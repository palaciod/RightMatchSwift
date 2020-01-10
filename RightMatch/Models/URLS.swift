//
//  URLS.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/27/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation
import FirebaseStorage
// This class will be used to return urls.. I kept it seperate from the recycler to keep the recycler file clean
class URLS {
    let key: String?
    let imageReference: StorageReference?
    var firstPicture: URL?
    var secondPicture: URL?
    var thirdPicture: URL?
    var fourthPicture: URL?
    var fifthPicture: URL?
    var sixthPicture: URL?
    // 
    var urlArray: [URL]?
    init(_key: String) {
        key = _key
        imageReference = FirebaseModel.storeage.reference().child("users").child(key!).child("pictures")
        urlArray = [URL]()
    }
    public func getFirstPictureUrl(){
        self.imageReference!.child("firstPicture").downloadURL { (_url, error) in
            self.firstPicture = _url
        }
    }
    public func getSecondPictureUrl(){
        self.imageReference!.child("secondPicture").downloadURL { (_url, error) in
            self.secondPicture = _url
        }
    }
    public func getThirdPicture(){
        self.imageReference!.child("thirdPicture").downloadURL { (_url, error) in
            self.thirdPicture = _url
        }
    }
    public func getFourthPicture(){
        self.imageReference!.child("fourthPicture").downloadURL { (_url, error) in
            self.fourthPicture = _url
        }
    }
    public func getFifthPicture(){
        self.imageReference!.child("fifthPicture").downloadURL { (_url, error) in
            self.fifthPicture = _url
        }
    }
    public func getSixthPicture(){
        self.imageReference!.child("sixthPicture").downloadURL { (_url, error) in
            self.sixthPicture = _url
        }
    }
    
    
    
}
