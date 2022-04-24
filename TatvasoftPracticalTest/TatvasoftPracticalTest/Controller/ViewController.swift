//
//  ViewController.swift
//  TatvasoftPracticalTest
//
//  Created by Dhruv Rajpurohit on 24/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlet and Properties
    @IBOutlet weak var userTableView: UITableView!
    var arrUserData = [Users]()
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ApiManager.shared.fetchUserdata(userURL: "users?offset=\(arrUserData.count)&limit=10") { userResult in
            self.arrUserData.append(contentsOf: userResult.users ?? [])
            self.userTableView.reloadData()
        }
    }

}

// MARK: Tableview - UITableViewDelegate, UITableViewDataSource methods
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUserData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? userCell else { return UITableViewCell() }
        cell.userDetail = arrUserData[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
