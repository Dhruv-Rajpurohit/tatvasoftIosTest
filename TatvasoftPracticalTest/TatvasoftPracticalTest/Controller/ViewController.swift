//
//  ViewController.swift
//  TatvasoftPracticalTest
//
//  Created by Dhruv Rajpurohit on 24/04/22.
//

import UIKit

// MARK: - Declaring Protocol
protocol userListView: AnyObject {
    func updateUserList()
}

class ViewController: UIViewController {
    
    // MARK: - Outlet and Properties
    @IBOutlet weak var userTableView: UITableView!
    
    var userListVM: UserListViewModel?
    var profileHeight = 60.0
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
}

// MARK: - Methods
extension ViewController {
    func configureView() {
        self.userListVM = UserListViewModel(view: self)
        self.userListVM?.getUsers()
    }
}

// MARK: Tableview - UITableViewDelegate, UITableViewDataSource methods
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userListVM?.arrUserData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? userCell else { return UITableViewCell() }
        cell.userDetail = self.userListVM?.arrUserData[indexPath.row]
        if indexPath.row == (self.userListVM?.arrUserData.count)! - 1 && ((self.userListVM?.hasMoreData) != nil) {
            self.userListVM?.getUsers()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let totalItems = self.userListVM?.arrUserData[indexPath.row].items?.count
        if totalItems == 1 {
            return profileHeight + (screenWidth - 40)
        }
        if (totalItems ?? 0) % 2 == 0 {
            return totalItems == 2 ? profileHeight + screenWidth/2 : profileHeight + screenWidth
        }
        return totalItems == 3 ? profileHeight +  screenWidth * 1.5 - 20 : profileHeight + screenWidth * 2 - 20
    }
}

//MARK: - Conforming Protocol
extension ViewController: userListView {
    func updateUserList() {
        self.userTableView.reloadData()
    }
}
