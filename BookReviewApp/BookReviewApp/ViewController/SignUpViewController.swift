//
//  SignUpViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/06/02.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {

//    let scrollView = UIScrollView()
    
    let emailTF = UITextField(frame: CGRect(x: 0, y: 0, width: 150.0, height: 0))
    let pwTF = UITextField(frame: CGRect(x: 0, y: 0, width: 150.0, height: 0))
    let pwCheckTF = UITextField(frame: CGRect(x: 0, y: 0, width: 150.0, height: 0))
    let nameTF = UITextField(frame: CGRect(x: 0, y: 0, width: 150.0, height: 0))
    let ageTF = UITextField(frame: CGRect(x: 0, y: 0, width: 150.0, height: 0))
    let readTF = UITextField(frame: CGRect(x: 0, y: 0, width: 150.0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupScrollView()
        configure()
        keyboardSetup()
        tapBackground()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 1.5)
    }
    
//    func setupScrollView() {
//        view.addSubview(scrollView)
//        scrollView.snp.makeConstraints {
//            $0.top.left.right.bottom.equalToSuperview()
//        }
//    }
    
    let emailTitle : UILabel = {
        let lb = UILabel()
        lb.textColor = CustomColor().textColor
        lb.font = CustomFont().title_main
        lb.text = "아이디"
        return lb
    }()
    
    let pwTitle : UILabel = {
        let lb = UILabel()
        lb.textColor = CustomColor().textColor
        lb.font = CustomFont().title_main
        lb.text = "비밀번호"
        return lb
    }()
    
    let pwCheckTitle : UILabel = {
        let lb = UILabel()
        lb.textColor = CustomColor().textColor
        lb.font = CustomFont().title_main
        lb.text = "비밀번호 재확인"
        return lb
    }()
    
    let signinLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = CustomColor().textColor
        lb.font = CustomFont().title_section
        lb.text = "회원가입"
        return lb
    }()
    
    let nameLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = CustomColor().textColor
        lb.font = CustomFont().title_main
        lb.text = "이름"
        return lb
    }()
    
    let readLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = CustomColor().textColor
        lb.font = CustomFont().title_main
        lb.text = "한 달에 몇권이나 읽나요?"
        return lb
    }()

    let closeButton : UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "xmark"), for: .normal)
        bt.imageView?.contentMode = .scaleAspectFit
        bt.imageEdgeInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
        bt.tintColor = CustomColor().textColor
        bt.addTarget(self, action: #selector(close), for: .touchUpInside)
  
        return bt
    }()
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    let signupButton : UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .systemPink
        bt.setTitle("회원가입", for: .normal)
        bt.titleLabel?.font = CustomFont().title_header
        bt.titleLabel?.textColor = UIColor.white
        
        bt.contentMode = .scaleAspectFill
        bt.layer.cornerRadius = 8.0
        bt.layer.masksToBounds = true
        
        bt.addTarget(self, action: #selector(signup), for: .touchUpInside)
        
        return bt
    }()
    
    @objc func signup() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configure() {
        self.view.backgroundColor = CustomColor().defaultBackgroundColor
        
        [emailTF,emailTitle,pwTF,pwTitle,pwCheckTF,pwCheckTitle,signinLabel,nameLabel,nameTF,readLabel,readTF,closeButton,signupButton].forEach { view.addSubview($0) }
        
        [emailTF,pwTF,pwCheckTF,nameTF,readTF].forEach { LoginViewController().tfConfigure($0) }
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.left.equalToSuperview().offset(20)
        }

        signinLabel.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        emailTitle.snp.makeConstraints {
            $0.top.equalTo(signinLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.left.equalTo(emailTF.snp.left)
        }
        emailTF.snp.makeConstraints {
            $0.top.equalTo(emailTitle.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        pwTitle.snp.makeConstraints {
            $0.top.equalTo(emailTF.snp.bottom).offset(20)
            $0.left.equalTo(emailTitle.snp.left)
        }
        
        pwTF.snp.makeConstraints {
            $0.top.equalTo(pwTitle.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        pwCheckTitle.snp.makeConstraints {
            $0.top.equalTo(pwTF.snp.bottom).offset(20)
            $0.left.equalTo(emailTitle.snp.left)
        }
        
        pwCheckTF.snp.makeConstraints {
            $0.top.equalTo(pwCheckTitle.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(pwCheckTF.snp.bottom).offset(20)
            $0.left.equalTo(emailTitle.snp.left)
        }
        
        nameTF.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        readLabel.snp.makeConstraints {
            $0.top.equalTo(nameTF.snp.bottom).offset(20)
            $0.left.equalTo(emailTitle.snp.left)
        }
        
        readTF.snp.makeConstraints {
            $0.top.equalTo(readLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        signupButton.snp.makeConstraints {
            $0.top.equalTo(readTF.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
    }
    
    func keyboardSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func keyboardRemove() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        let userInfo: NSDictionary = sender.userInfo! as NSDictionary
        let keyboardFrame: NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        if emailTF.isEditing == true {
            keyboardAnimate(keyboardRectangle, emailTF)
        } else if pwTF.isEditing == true {
            keyboardAnimate(keyboardRectangle, pwTF)
        } else if pwCheckTF.isEditing == true {
            keyboardAnimate(keyboardRectangle, pwCheckTF)
        } else if nameTF.isEditing == true {
            keyboardAnimate(keyboardRectangle, nameTF)
        } else if readTF.isEditing == true {
            keyboardAnimate(keyboardRectangle, readTF)
        }
    }
    
    func keyboardAnimate(_ keyboardRectangle: CGRect,_ textField: UITextField) {
        if keyboardRectangle.height > (self.view.frame.height - textField.frame.maxY) {
            self.view.transform = CGAffineTransform(translationX: 0, y: (self.view.frame.height - keyboardRectangle.height - textField.frame.maxY))
        }
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.transform = .identity
    }
    
    func tapBackground() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
