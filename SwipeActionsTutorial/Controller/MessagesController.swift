//
//  MessagesController.swift
//  SwipeActionsTutorial
//
//  Created by Stephen Dowless on 2/21/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MessageCell"

class MessagesController: UITableViewController {
    
    // MARK: - Properties
    
    var users = [User]()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        configureUsers()
    }
    
    // MARK: - Helper Functions
    
    func configureUsers() {
        let user1 = User(username: "Joker", profileImage: #imageLiteral(resourceName: "joker"), isFavorite: false)
        let user2 = User(username: "Superman", profileImage: #imageLiteral(resourceName: "superman"), isFavorite: false)
        let user3 = User(username: "Venom", profileImage: #imageLiteral(resourceName: "venom"), isFavorite: false)
        let user4 = User(username: "Spiderman", profileImage: #imageLiteral(resourceName: "spiderman"), isFavorite: false)
        let user5 = User(username: "Ironman", profileImage: #imageLiteral(resourceName: "ironman"), isFavorite: false)
        
        users.append(user1)
        users.append(user2)
        users.append(user3)
        users.append(user4)
        users.append(user5)
        
    }
    
    func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.barStyle = .black
    }
    
    func configureTableView() {
        tableView.register(MessageCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 80
    }
}
extension MessagesController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MessageCell
        cell.user = users[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(users[indexPath.row].isFavorite)
    }
}
