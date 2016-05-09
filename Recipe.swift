//
//  Recipe.swift
//  Recipes
//
//  Created by Bono Kim on 5/6/16.
//  Copyright © 2016 Engene. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func setRecipeImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getRecipeImage() -> UIImage {
        let img = UIImage(data: self.image!)
        return img!
    }

}
