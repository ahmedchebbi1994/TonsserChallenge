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
    
    var displayTextFistName: String {
        return follower.firstname?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }
    
    var displayTextLastName: String {
        return follower.lastname?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }
    
    var displayTxtSlug: String {
        return follower.slug ?? ""
    }
    
    var displayTxtUrlProfilePicture: String {
        return follower.profilePicture ?? ""
    }
    
    var displayTxtLogoClub: String {
        return follower.team?.club?.logoURL ?? ""
    }
    
    var displayTxtClubName: String {
        return follower.club?.name ?? ""
    }
    
    var displayTxtTeamName: String {
        return follower.team?.name ?? ""
    }
    
    var displayTxtLeagueName: String {
        return follower.team?.league?.name ?? ""
    }
    
    var displayTxtLeagueNumberPlayer: String {
        return "\(follower.team?.league?.leaguePlayerCount ?? 0)"
    }
    
    var displayTxtLeagueLevel: String {
        return follower.team?.league?.level ?? ""
    }
    
    var displayTxtSeasonStart: String {
        return follower.team?.season?.start ?? ""
    }
    
    var displayTxtSeasonEnd: String {
        return follower.team?.season?.end ?? ""
    }
    
    var displayTxtPositionCode: String {
        return follower.primaryPosition?.abbreviation?.uppercased() ?? ""
    }
    
    var displayTxtPositionName: String {
        return follower.primaryPosition?.name ?? ""
    }
    
    init(follower: Follower) {
        self.follower = follower
    }
}
