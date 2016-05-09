//
//  ViewController.swift
//  Recipes
//
//  Created by Bono Kim on 5/4/16.
//  Copyright © 2016 Engene. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    var recipes = [Recipe]() // number of records

    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTableView.delegate = self
        recipeTableView.dataSource = self

    }
    
    override func viewDidAppear(animated: Bool) {
        fetchRequestAndSetFetchResults()
        recipeTableView.reloadData()
    }
    
    func fetchRequestAndSetFetchResults() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        
        do {
            let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest)
            self.recipes = fetchResults as! [Recipe]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell") as? RecipeTableViewCell {
            
            let recipe = recipes[indexPath.row]
            cell.configureCell(recipe)
            return cell
            
        } else {
            return RecipeTableViewCell()
        }
    }




}

