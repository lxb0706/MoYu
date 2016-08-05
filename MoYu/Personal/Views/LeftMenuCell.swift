//
//  MOLeftMenu.swift
//  MoYu
//
//  Created by Chris on 16/4/3.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class LeftMenuView: UIView {

    
    override func awakeFromNib() {
        
        self.setupView()
    }
    
    //MARK: - public method

    func updateHeader(user user:UserInfo){
        
        var nickname = user.nickname
        if nickname.isEmpty{
            nickname = "未设置"
        }
        
        var phone = user.phonenum
        if phone.isEmpty{
            phone = "未绑定手机"
        }
        
        headerUsernameLabel.text = nickname
        headerPhoneLabel.text = phone
        
       headerImageView.mo_loadImage(user.img, placeholder: UIImage(named: "defalutHead")!)
    }
    
    private func setupView(){
        
        headerImageView.layer.cornerRadius = headerImageView.bounds.size.height/2.0
        headerImageView.layer.masksToBounds = true
        
        headerBackView.layer.cornerRadius = headerBackView.bounds.size.height/2.0
        headerBackView.layer.masksToBounds = true
        headerBackView.layer.borderColor = UIColor.whiteColor().CGColor
        headerBackView.layer.borderWidth = 2.0
        
        //tableView
        tableView.separatorStyle = .None
        tableView.bounces = false
        
        //auth
        isMerchantAuth = false
        isCustomerAuth = false
    }

    private func updateAuthImageView(imageView:UIImageView,flag:Bool){
        var color:UIColor
        if flag {
           color = UIColor.mo_main()
        }else{
            color = UIColor.mo_mercury()
        }
        
        guard let image = imageView.image else{
            return
        }
        imageView.image? = image.mo_changeColor(color)
    }
    
    
    //MARK: - var & let
    var isMerchantAuth = true {
        didSet{
            if isMerchantAuth != oldValue {
                self.updateAuthImageView(headerMerchantAuthImageView, flag: isMerchantAuth)
            }
        }
    }
    
    var isCustomerAuth = true {
        didSet{
            if isCustomerAuth != oldValue {
                self.updateAuthImageView(headerCustomAuthImageView, flag: isCustomerAuth)
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var headerBackView: UIView!
    @IBOutlet private weak var headerImageView: UIImageView!
    @IBOutlet private weak var headerCustomAuthImageView: UIImageView!
    @IBOutlet private weak var headerMerchantAuthImageView: UIImageView!
    @IBOutlet private weak var headerUsernameLabel: UILabel!
    @IBOutlet private weak var headerPhoneLabel: UILabel!
}
