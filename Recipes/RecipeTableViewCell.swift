//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Bono Kim on 5/6/16.
//  Copyright © 2016 Engene. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(recipe: Recipe) {
        
        recipeTitleLabel.text = recipe.title
        recipeImageView.image = recipe.getRecipeImage()
    }



}
