//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Ousmane Ouedraogo on 2/26/19.
//  Copyright © 2019 Ousmane Ouedraogo. All rights reserved.
//

import UIKit
import SafariServices;

class FoodTableViewController: UITableViewController {
    
    //A stored property would work just as well.
    
    var meals: [Meal] = [
        Meal(name: "breakfast", food: [
            Food(name: "Milk", description: "from cow"),
            Food(name: "Cereal", description: "crunchy granola"),
            Food(name: "Yogurt", description: "very sour")
            ]),
        
        Meal(name: "lunch", food: [
            Food(name: "Tuna", description: "sandwich"),
            Food(name: "Orange Juice", description: "orange")
            ]),
        
        Meal(name: "supper", food: [
            Food(name: "Steak", description: "meat")
            ])
    ];

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)

        // Configure the cell...
        let meal: Meal = meals[indexPath.section];
        let food: Food = meal.food[indexPath.row];
        cell.textLabel?.text = food.name;
        cell.detailTextLabel?.text = food.description;
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meal: Meal = meals[indexPath.section];
        let food: Food = meal.food[indexPath.row];
        print("selected \(food.name) in cell number \(indexPath)");
        
        var urlComponents: URLComponents = URLComponents();
        urlComponents.scheme = "https";
        urlComponents.host = "en.wikipedia.org";   //English
        urlComponents.path = "/wiki/\(food)";
        
        guard let url: URL = urlComponents.url else {
            fatalError("could not create url for state \(food)");
        }
        
        let safariViewController: SFSafariViewController = SFSafariViewController(url: url);
        present(safariViewController, animated: true);
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
