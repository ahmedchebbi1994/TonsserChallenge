//
//  DetailFollowerViewController.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 11/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import UIKit

class DetailFollowerViewController: BindableViewController<DetailFollowerView, FollowerViewModel> {
    
    
    // MARK: - Bind View Model
    
    func bindViewModel() { // Here we glue the view model and the view together
        // .....
        // View Model's properties are accessible like: viewModel.title
        // View's properties are also accessible like: layout.titleLabel
        // ....
        
        self.title = viewModel.displayTextName
        
        
        self.layout.nameTxt.text = "\(viewModel.displayTextFistName) \(viewModel.displayTextLastName)"
        if let url = URL(string: "\(viewModel.displayTxtUrlProfilePicture)?width=150"){
            MTAPIClient.downloadImage(url: url) { (img, err) in
                if err == nil {
                    DispatchQueue.main.async {
                        self.layout.profileIcon.image = img
                        self.layout.profileIcon.addCircleGradiendBorder(4)
                    }
                }
            }
        }
        
        self.layout.clubNameTxt.text = self.viewModel.displayTxtClubName
        if let url = URL(string: "\(viewModel.displayTxtLogoClub)"){
            MTAPIClient.downloadImage(url: url) { (img, err) in
                if err == nil {
                    DispatchQueue.main.async {
                        self.layout.teamIcon.image = img
                    }
                }
            }
        }
        
        self.layout.teamNameTxt.text = self.viewModel.displayTxtTeamName        
        if  self.viewModel.displayTxtLeagueName.isEmpty == false{
            self.layout.teamLeagueNameTxt.text = "\(self.layout.teamLeagueNameTxt.text ?? "") \(self.viewModel.displayTxtLeagueName)"
        } else {
            self.layout.teamLeagueNameTxt.isHidden = true
        }
        
        if self.viewModel.displayTxtLeagueNumberPlayer.isEmpty == false{
            self.layout.teamPlayerCountTxt.text = "\(self.layout.teamPlayerCountTxt.text ?? "") \(self.viewModel.displayTxtLeagueNumberPlayer)"
        } else {
            self.layout.teamPlayerCountTxt.isHidden = true
        }
        
        if self.viewModel.displayTxtLeagueLevel.isEmpty == false{
            self.layout.teamLevelCountTxt.text = "\(self.layout.teamLevelCountTxt.text ?? "") \(self.viewModel.displayTxtLeagueLevel)"
        } else {
            self.layout.teamLevelCountTxt.isHidden = true
        }
        
        if self.viewModel.displayTxtSeasonStart.isEmpty == false{
            self.layout.startSeasonTxt.text = "\(self.layout.startSeasonTxt.text ?? "") \(self.viewModel.displayTxtSeasonStart)"
        } else {
            self.layout.startSeasonTxt.isHidden = true
        }
        
        if self.viewModel.displayTxtSeasonEnd.isEmpty == false{
            self.layout.endSeasonTxt.text = "\(self.layout.endSeasonTxt.text ?? "") \(self.viewModel.displayTxtSeasonEnd)"
        } else {
            self.layout.endSeasonTxt.isHidden = true
        }
        
        self.layout.positionTitleTxt.text = "\(self.layout.positionTitleTxt.text ?? "") \(self.viewModel.displayTxtPositionName.uppercased())"
        
        if !self.viewModel.displayTxtPositionCode.isEmpty {
            if let img = UIImage(named: "position_\(self.viewModel.displayTxtPositionCode)") {
                self.layout.positionImage.image = img
            }
        }
        
        
    }
}
