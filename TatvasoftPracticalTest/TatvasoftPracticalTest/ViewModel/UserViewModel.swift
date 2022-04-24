//
//  UserViewModel.swift
//  TatvasoftPracticalTest
//
//  Created by Dhruv Rajpurohit on 24/04/22.
//

import Foundation

class UserListViewModel {
    // MARK: - Properties
    weak var userListView: userListView?
    var arrUserData = [Users]()
    var hasMoreData = false
    
    init(view: userListView) {
        self.userListView = view
    }
}

// MARK: - Methods
extension UserListViewModel {
    /// get user details
    /// offset: Postion where user will start
    /// limit: Return total number of users
    func getUsers() {
        ApiManager.shared.fetchUserdata(userURL: "users?offset=\(arrUserData.count)&limit=10") { userResult in
            self.arrUserData.append(contentsOf: userResult.users ?? [])
            self.hasMoreData = userResult.has_more ?? false
            self.userListView?.updateUserList()
        }
    }
}
