//
//  TableViewController.swift
//  Whitehouse Petitions
//
//  Created by murad on 07/05/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var petitions = [Petition]()
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
        
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
        cell.textLabel?.text = petitions[indexPath.row].title
        cell.detailTextLabel?.text = petitions[indexPath.row].body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Parse data from JSON to Petitions array
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonDecoder = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonDecoder.results
            tableView.reloadData()
        }
    }
}
