//
//  ViewController.swift
//  Radar4Apr2017
//
//  Created by Daniel Loewenherz on 4/14/17.
//  Copyright © 2017 Lionheart Software LLC. All rights reserved.
//

import UIKit

let CellIdentifier = "CellIdentifier"

class ViewController: UITableViewController {

}

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        cell.textLabel?.text = "Cell #\(indexPath.row)"
        if indexPath == [0, 0] {
            cell.detailTextLabel?.text = "Display share and delete actions"
        } else {
            cell.detailTextLabel?.text = "*Should* have no edit actions…"
        }

        cell.detailTextLabel?.textColor = .gray
        return cell
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        guard indexPath == [0, 0] else {
            print("Don't display edit actions…but look at the table view. 🤔")
            return nil
        }

        print("Display edit actions.")
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _ in }
        let shareAction = UITableViewRowAction(style: .normal, title: "Share") { _ in }
        return [deleteAction, shareAction]
    }
}
