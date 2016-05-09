//
//  CreateRecipeViewController.swift
//  Recipes
//
//  Created by Bono Kim on 5/9/16.
//  Copyright © 2016 Engene. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var recipeTitleTextField: UITextField!
    @IBOutlet weak var recipeIngredientsTextField: UITextField!
    @IBOutlet weak var recipeStepsTextField: UITextField!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var addRecipeImageButton: UIButton!

    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        recipeImageView.layer.cornerRadius = 4.0
        recipeImageView.clipsToBounds = true
        
        recipeTitleTextField.becomeFirstResponder()

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImageView.image = image
    }

    @IBAction func addRecipeImage(sender: AnyObject) {
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func createRecipe(sender: AnyObject) {
        
        if let title = recipeTitleTextField.text where title != "" {
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedObjectContext = appDelegate.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: managedObjectContext)
            let recipe = Recipe(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            recipe.title = title
            recipe.ingredients = recipeIngredientsTextField.text
            recipe.setRecipeImage(recipeImageView.image!)
            
            managedObjectContext.insertObject(recipe)
            
            do {
                
                try managedObjectContext.save()
                
            } catch {
                
                print("Could not save your recipe...")
            }
            
            self.navigationController?.popToRootViewControllerAnimated(true)
        }

    }

}
