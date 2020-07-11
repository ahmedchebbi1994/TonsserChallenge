//
//  ListFollowersTableViewCell.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 10/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import UIKit
import RxSwift
import Combine
class ListFollowersTableViewCell: UITableViewCell {
    
    // MARK: - Property
    static let identifier = "ListFollowersTableViewCell"
    let disposeBag = DisposeBag()
    private var animator: UIViewPropertyAnimator?
    
    // MARK: - IBOutlet
    
    
    private lazy var nameTxt: UILabel = {
        let st = UILabel()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.font = UIFont.boldSystemFont(ofSize: 17)
        return st
    }()
    
    private lazy var teamIconView: UIView = {
        let st = UIView()
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    private lazy var teamIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.image = #imageLiteral(resourceName: "placeholder")
        img.clipsToBounds = true
        return img
    }()
    
    private lazy var stackViewDescriptionHeader: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.distribution = .fill
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 5
        return st
    }()
    
    
    private lazy var teamNameTxt: UILabel = {
        let st = UILabel()
        st.translatesAutoresizingMaskIntoConstraints = false
        
        return st
    }()
    
    private lazy var stackViewDescription: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fillEqually
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 5
        
        return st
    }()
    
    
    private lazy var profileIconView: UIView = {
        let st = UIView()
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    private lazy var profileIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = #imageLiteral(resourceName: "placeholder")
        img.layer.cornerRadius = img.frame.size.width / 2
        img.clipsToBounds = true
        return img
    }()
    
    private lazy var stackViewMainView: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.distribution = .fill
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 15
        st.customize(backgroundColor: .white, radiusSize: 10)
        
        return st
    }()
    
    
    // MARK: - Init constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.profileIcon.addCircleGradiendBorder(4)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Views
    private func setupViews(){
        
        self.selectionStyle = .none
        
        self.teamIconView.addSubview(teamIcon)
        
        self.stackViewDescriptionHeader.addArrangedSubview(nameTxt)
        self.stackViewDescriptionHeader.addArrangedSubview(teamIconView)
        
        self.stackViewDescription.addArrangedSubview(stackViewDescriptionHeader)
        self.stackViewDescription.addArrangedSubview(teamNameTxt)
        
        self.profileIconView.addSubview(profileIcon)
        
        self.stackViewMainView.addArrangedSubview(profileIconView)
        self.stackViewMainView.addArrangedSubview(stackViewDescription)
        
        
        self.contentView.addSubview(stackViewMainView)
        
        
        
        
        self.contentView.backgroundColor = UIColor(named: Constant.Colors.backgroundMainView)
        
    }
    
    // MARK: - Setting Constraints
    private func setupConstraints() {
        
        profileIconView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        profileIconView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        teamIconView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        teamIcon.topAnchor.constraint(equalTo: teamIconView.topAnchor,constant: 2).isActive = true
        teamIcon.leadingAnchor.constraint(equalTo: teamIconView.leadingAnchor,constant: 2).isActive = true
        teamIcon.trailingAnchor.constraint(equalTo: teamIconView.trailingAnchor,constant: -2).isActive = true
        teamIcon.bottomAnchor.constraint(equalTo: teamIconView.bottomAnchor,constant: -2).isActive = true
        
        
        profileIcon.topAnchor.constraint(equalTo: profileIconView.topAnchor,constant: 5).isActive = true
        profileIcon.leadingAnchor.constraint(equalTo: profileIconView.leadingAnchor,constant: 5).isActive = true
        profileIcon.trailingAnchor.constraint(equalTo: profileIconView.trailingAnchor,constant: -5).isActive = true
        profileIcon.bottomAnchor.constraint(equalTo: profileIconView.bottomAnchor,constant: -5).isActive = true
        
        
        stackViewMainView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        stackViewMainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10).isActive = true
        stackViewMainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10).isActive = true
        stackViewMainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10).isActive = true
        
    }
    
    func bind(viewModel: FollowerViewModel){
        
        self.nameTxt.text = viewModel.displayTextName
        self.teamNameTxt.text = viewModel.displayTxtClubName
        
        if let url = URL(string: "\(viewModel.displayTxtUrlProfilePicture)?width=150"){
            MTAPIClient.downloadImage(url: url) { (img, err) in
                if err == nil {
                    DispatchQueue.main.async {
                        self.profileIcon.image = img
                        self.showImage(image: self.profileIcon.image)
                    }
                }
            }
        }
        
        if let url = URL(string: "\(viewModel.displayTxtLogoClub)"){
            MTAPIClient.downloadImage(url: url) { (img, err) in
                if err == nil {
                    DispatchQueue.main.async {
                        self.teamIcon.image = img
                        //self.showImage(image: self.teamIcon.image)
                    }
                }
            }
        }
        
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        profileIcon.image = nil
        profileIcon.alpha = 0.0
        animator?.stopAnimation(true)
    }
    
}
extension ListFollowersTableViewCell {
    
    private func showImage(image: UIImage?) {
        profileIcon.alpha = 0.0
        animator?.stopAnimation(false)
        animator?.finishAnimation(at: .current)
        profileIcon.image = image
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.profileIcon.alpha = 1.0
        })
        
    }
    
    
}
