//
//  TableViewController.swift
//  Whitehouse Petitions
//
//  Created by murad on 07/05/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var petitions = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        petitions.append("Check")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Title text"
        cell.detailTextLabel?.text = "Detail text"
        
        return cell
    }

}
