//
//  FollowerViewModel.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 11/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import UIKit

struct FollowerViewModel {

    var follower: Follower
    
    var displayTextName: String {
        return follower.name?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }
    
    var displayTxtSlug: String {
        return follower.slug ?? ""
    }
    
    var displayTxtUrlProfilePicture: String {
        return follower.profilePicture ?? ""
    }
    
    var displayTxtLogoTeam: String {
        return follower.team?.club?.logoURL ?? ""
    }
    
    var displayTxtTeamName: String {
        return follower.club?.name ?? ""
    }
    
    init(follower: Follower) {
        self.follower = follower
    }
}
