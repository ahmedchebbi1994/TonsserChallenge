//
//  FollowerDetailView.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 11/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import UIKit

class DetailFollowerView: ReusableUIView {
    
    // MARK: - Properties
    private let padding: CGFloat = 16
    
    
    // MARK: - IBOutlet Header List
    private(set) lazy var nameTxt: UILabel = {
        let st = UILabel()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 20)
        st.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return st
    }()
    
    private lazy var profileIconView: UIView = {
        let st = UIView()
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    private(set) lazy var profileIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = #imageLiteral(resourceName: "placeholder")
        img.clipsToBounds = true
        img.addCircleGradiendBorder(4)
        img.sizeToFit()
        return img
    }()
    
    private lazy var stackViewHeader: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fill
        st.alignment = .center
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 2
        return st
    }()
    
    private lazy var viewHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - IBOutlet Club
    
    private lazy var teamIconView: UIView = {
        let st = UIView()
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    private(set) lazy var teamIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = #imageLiteral(resourceName: "placeholder")
        img.clipsToBounds = true
        return img
    }()
    
    private(set) lazy var clubTitleTxt: UILabel = {
        let st = PaddingLabel(withInsets: 0, 0, 14, 0)
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 20)
        st.textColor = .lightGray
        st.text = "Club :"
        return st
    }()
    
    private(set) lazy var clubNameTxt: UILabel = {
        let st = PaddingLabel(withInsets: 0, 0, 14, 0)
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 15)
        st.text = "HELLO"
        return st
    }()
    
    private lazy var stackViewClub: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fill
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 10
        return st
    }()
    
    private lazy var stackViewClubBottom: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.distribution = .fill
        st.alignment = .center
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 10
        return st
    }()
    
    private lazy var viewClub: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    
    // MARK: - IBOutlet Team
    
    
    private(set) lazy var teamTitleTxt: UILabel = {
        let st = PaddingLabel(withInsets: 5, 0, 14, 0)
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 20)
        st.textColor = .lightGray
        st.text = "Team :"
        return st
    }()
    
    private(set) lazy var teamNameTxt: UILabel = {
        let st = PaddingLabel(withInsets: 0, 0, 10, 0)
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 15)
        st.textColor = .black
        st.text = "Tunisie"
        return st
    }()
    
    private(set) lazy var teamLeagueNameTxt: UILabel = {
        let st = PaddingLabel(withInsets: 0, 0, 10, 0)
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 15)
        st.textColor = .black
        st.text = "League :"
        return st
    }()
    
    
    private(set) lazy var teamPlayerCountTxt: UILabel = {
        let st = PaddingLabel(withInsets: 0, 0, 10, 0)
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 15)
        st.textColor = .black
        st.text = "Number player League : "
        return st
    }()
    
    private(set) lazy var teamLevelCountTxt: UILabel = {
        let st = PaddingLabel(withInsets: 0, 0, 10, 0)
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 15)
        st.textColor = .black
        st.text = "Level : "
        return st
    }()
    
    private(set) lazy var startSeasonTxt: UILabel = {
        let st = PaddingLabel(withInsets: 0, 0, 10, 0)
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 15)
        st.textColor = .black
        st.text = "Season Start : "
        return st
    }()
    
    private(set) lazy var endSeasonTxt: UILabel = {
        let st = PaddingLabel(withInsets: 0, 0, 10, 0)
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 15)
        st.textColor = .black
        st.text = "Season End : "
        return st
    }()
    
    private lazy var viewTeam: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true

        return view
    }()
    
    private lazy var stackViewTeam: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fillEqually
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 10
        return st
    }()
    
    
    
    
    // MARK: - IBOutlet Position
 
    private(set) lazy var positionTitleTxt: UILabel = {
        let st = PaddingLabel(withInsets: 0, 0, 14, 0)
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 20)
        st.textColor = .lightGray
        st.text = "Position :"
        return st
    }()
    
    private lazy var positionImageView: UIView = {
        let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.heightAnchor.constraint(equalToConstant: 250).isActive = true
          return view
    }()
    
    private(set) lazy var positionImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.image = #imageLiteral(resourceName: "placeholder")
        img.clipsToBounds = true
        return img
    }()
    
    private lazy var viewPosition: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var stackViewPosition: UIStackView = {
           let st = UIStackView()
           st.axis = .vertical
           st.distribution = .fill
           st.translatesAutoresizingMaskIntoConstraints = false
           st.spacing = 10
           return st
       }()
    
    // MARK: - IBOutlet Position

    
    // MARK: - IBOutlet
    
    private lazy var stackViewMainView: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 2
        return st
    }()
    
    private lazy var scrollViewMainView: UIScrollView = {
        let st = UIScrollView()
        st.translatesAutoresizingMaskIntoConstraints = false
        
        return st
    }()
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
    }
    
    // MARK: - Styling
    override func styleUI() {
        backgroundColor = UIColor(named: Constant.Colors.backgroundMainView)
    }
    
    // MARK: - Constraints
    override func makeConstraints() {
        //Position Image
        positionImage.topAnchor.constraint(equalTo: positionImageView.topAnchor,constant: 5).isActive = true
        positionImage.leadingAnchor.constraint(equalTo: positionImageView.leadingAnchor,constant: 5).isActive = true
        positionImage.trailingAnchor.constraint(equalTo: positionImageView.trailingAnchor,constant: -5).isActive = true
        positionImage.bottomAnchor.constraint(equalTo: positionImageView.bottomAnchor,constant: -5).isActive = true

        //Position
        stackViewPosition.topAnchor.constraint(equalTo: viewPosition.topAnchor, constant: 10).isActive = true
        stackViewPosition.leadingAnchor.constraint(equalTo: viewPosition.leadingAnchor, constant: 10).isActive = true
        stackViewPosition.trailingAnchor.constraint(equalTo: viewPosition.trailingAnchor, constant: -10).isActive = true
        stackViewPosition.bottomAnchor.constraint(equalTo: viewPosition.bottomAnchor, constant: -10).isActive = true

        //Team
        stackViewTeam.topAnchor.constraint(equalTo: viewTeam.topAnchor, constant: 10).isActive = true
        stackViewTeam.leadingAnchor.constraint(equalTo: viewTeam.leadingAnchor, constant: 10).isActive = true
        stackViewTeam.trailingAnchor.constraint(equalTo: viewTeam.trailingAnchor, constant: -10).isActive = true
        stackViewTeam.bottomAnchor.constraint(equalTo: viewTeam.bottomAnchor, constant: -10).isActive = true

        //Club
        stackViewClub.topAnchor.constraint(equalTo: viewClub.topAnchor, constant: 10).isActive = true
        stackViewClub.leadingAnchor.constraint(equalTo: viewClub.leadingAnchor, constant: 10).isActive = true
        stackViewClub.trailingAnchor.constraint(equalTo: viewClub.trailingAnchor, constant: -10).isActive = true
        stackViewClub.bottomAnchor.constraint(equalTo: viewClub.bottomAnchor, constant: -10).isActive = true
        
        //Header
        stackViewHeader.topAnchor.constraint(equalTo: viewHeader.topAnchor, constant: 10).isActive = true
        stackViewHeader.leadingAnchor.constraint(equalTo: viewHeader.leadingAnchor, constant: 10).isActive = true
        stackViewHeader.trailingAnchor.constraint(equalTo: viewHeader.trailingAnchor, constant: -10).isActive = true
        stackViewHeader.bottomAnchor.constraint(equalTo: viewHeader.bottomAnchor, constant: -10).isActive = true

        scrollViewMainView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        scrollViewMainView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scrollViewMainView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollViewMainView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        stackViewMainView.centerXAnchor.constraint(equalTo: scrollViewMainView.centerXAnchor).isActive = true
        stackViewMainView.widthAnchor.constraint(equalTo: scrollViewMainView.widthAnchor).isActive = true
        stackViewMainView.topAnchor.constraint(equalTo: scrollViewMainView.topAnchor).isActive = true
        stackViewMainView.bottomAnchor.constraint(equalTo: scrollViewMainView.bottomAnchor).isActive = true
        
        //Constraint ICON Profile
        profileIconView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileIconView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        profileIcon.topAnchor.constraint(equalTo: profileIconView.topAnchor,constant: 5).isActive = true
        profileIcon.leadingAnchor.constraint(equalTo: profileIconView.leadingAnchor,constant: 5).isActive = true
        profileIcon.trailingAnchor.constraint(equalTo: profileIconView.trailingAnchor,constant: -5).isActive = true
        profileIcon.bottomAnchor.constraint(equalTo: profileIconView.bottomAnchor,constant: -5).isActive = true
        
        //Icon team
        teamIconView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        teamIconView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        teamIcon.topAnchor.constraint(equalTo: teamIconView.topAnchor,constant: 2).isActive = true
        teamIcon.leadingAnchor.constraint(equalTo: teamIconView.leadingAnchor,constant: 2).isActive = true
        teamIcon.trailingAnchor.constraint(equalTo: teamIconView.trailingAnchor,constant: -2).isActive = true
        teamIcon.bottomAnchor.constraint(equalTo: teamIconView.bottomAnchor,constant: -2).isActive = true
        
        
    }
    
    // MARK: - setupUI
    override func setupUI() {
        
        self.profileIconView.addSubview(profileIcon)
        self.stackViewHeader.addArrangedSubview(profileIconView)
        self.stackViewHeader.addArrangedSubview(nameTxt)
        
        self.teamIconView.addSubview(teamIcon)
        self.stackViewClubBottom.addArrangedSubview(self.clubNameTxt)
        self.stackViewClubBottom.addArrangedSubview(self.teamIconView)
        self.stackViewClub.addArrangedSubview(self.clubTitleTxt)
        self.stackViewClub.addArrangedSubview(self.stackViewClubBottom)
        
        self.stackViewTeam.addArrangedSubview(teamTitleTxt)
        self.stackViewTeam.addArrangedSubview(teamNameTxt)
        self.stackViewTeam.addArrangedSubview(teamLeagueNameTxt)
        self.stackViewTeam.addArrangedSubview(teamPlayerCountTxt)
        self.stackViewTeam.addArrangedSubview(teamLevelCountTxt)
        self.stackViewTeam.addArrangedSubview(startSeasonTxt)
        self.stackViewTeam.addArrangedSubview(endSeasonTxt)
        
        self.stackViewPosition.addArrangedSubview(positionTitleTxt)
        self.positionImageView.addSubview(positionImage)
        self.stackViewPosition.addArrangedSubview(positionImageView)
        
        self.viewTeam.addSubview(self.stackViewTeam)
        self.viewPosition.addSubview(self.stackViewPosition)
        self.viewClub.addSubview(self.stackViewClub)
        self.viewHeader.addSubview(self.stackViewHeader)
        
        self.stackViewMainView.addArrangedSubview(viewHeader)
        self.stackViewMainView.addArrangedSubview(viewClub)
        self.stackViewMainView.addArrangedSubview(viewTeam)
        self.stackViewMainView.addArrangedSubview(viewPosition)
        
        scrollViewMainView.addSubview(stackViewMainView)
        addSubview(scrollViewMainView)
        
    }
    
    // MARK: - configUI
    override func configUI() {
        
        self.stackViewPosition.customize(backgroundColor: .white, radiusSize: 5)
        self.stackViewTeam.customize(backgroundColor: .white, radiusSize: 5)
        self.stackViewClub.customize(backgroundColor: .white, radiusSize: 5)
        self.stackViewHeader.customize(backgroundColor: .white, radiusSize: 5)
        
    }
    
}
