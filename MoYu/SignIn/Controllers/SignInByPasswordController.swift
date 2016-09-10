//
//  SignInByPasswordController.swift
//  MoYu
//
//  Created by Chris on 16/7/10.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

private enum TextFieldType:Int{

    case Username = 1
    case Password
    
    func maxLength()->Int{
        switch self {
        case .Username:
            return 11
        case .Password:
            return 25
        }
    }
    
    func minLength()->Int{
        switch self {
        case .Username:
            return 11
        case .Password:
            return 6
        }
    }
}

class SignInByPasswordController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.mo_navigationBar(opaque: false)
    }

    //MARK: - event reponse
    func enterButtonClicked(sender:UIButton){
        
        guard let username = signInView.userTextfield.text where !username.isEmpty,
            let password = signInView.passwordTextFiled.text where !password.isEmpty else{
                println("手机或密码不能为空")
                return
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: - private method
    private func setupView(){
        
        signInView.userTextfield.delegate = self
        signInView.userTextfield.tag = TextFieldType.Username.rawValue
        
        signInView.passwordTextFiled.delegate = self
        signInView.passwordTextFiled.tag = TextFieldType.Password.rawValue
        
        signInView.enterButton.addTarget(self, action: #selector(enterButtonClicked), forControlEvents: .TouchUpInside)
    }
    
    
    @IBOutlet var signInView: SignInByPasswordView!
}

extension SignInByPasswordController:UITextFieldDelegate{

    func textFieldDidEndEditing(textField: UITextField) {
        //
        print("end editing")
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        guard let type = TextFieldType(rawValue: textField.tag) else{  return true }
        
        var text:String
        if let str = textField.text {
            text = str + string
        }else{
            text = string
        }
        
        if text.mo_length() <= type.maxLength(){
            return true
        }else{
            return false
        }
    }
}
