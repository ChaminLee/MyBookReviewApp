//
//  LoginViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/05/17.
//

import UIKit
import FirebaseAuth
import SnapKit
//import DropDown

class LoginViewController: UIViewController, UITextFieldDelegate {
        
    let emailTF = UITextField(frame: CGRect(x: 0, y: 0, width: 150.0, height: 0))
    let pwTF = UITextField(frame: CGRect(x: 0, y: 0, width: 150.0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardSetup()
        tapBackground()
        configure()

    }
    // 기본뷰
    
    let loginImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "0006")
        
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 8.0
        img.layer.masksToBounds = true
        return img
    }()
    
    let emailTitle : UILabel = {
        let lb = UILabel()
        lb.textColor = CustomColor().textColor
        lb.font = CustomFont().title_header
        lb.text = "아이디"
        return lb
    }()
    
    let pwTitle : UILabel = {
        let lb = UILabel()
        lb.textColor = CustomColor().textColor
        lb.font = CustomFont().title_header
        lb.text = "비밀번호"
        return lb
    }()
    
    let loginButton : UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .black
        bt.setTitle("로그인", for: .normal)
        bt.titleLabel?.font = CustomFont().title_header
        bt.titleLabel?.textColor = UIColor.white
        
        bt.contentMode = .scaleAspectFill
        bt.layer.cornerRadius = 8.0
        bt.layer.masksToBounds = true
        
        bt.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        return bt
    }()
    
    @objc func login() {
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        print("rr")
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
        let vc = SignUpViewController() 
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        print("rr")
    }
    
    func configure() {
        self.keyboardSetup()
        view.backgroundColor = CustomColor().defaultBackgroundColor
        
        [emailTF,pwTF].map { tfConfigure($0) }
        
//
//        emailTF.delegate = self
//        pwTF.delegate = self
        
        view.addSubview(loginImage)
        view.addSubview(emailTF)
        view.addSubview(pwTF)
        view.addSubview(loginButton)
        view.addSubview(signupButton)
        
        loginImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-70)
        }

        emailTF.snp.makeConstraints {
            $0.top.equalTo(loginImage.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        pwTF.snp.makeConstraints {
            $0.top.equalTo(emailTF.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTF.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
            
        }
        signupButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
    }
    
    public func tfConfigure(_ tf: UITextField) {
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 6.0
        tf.layer.masksToBounds = true
        
        var placeholder = ""
        switch tf {
        case emailTF:
            placeholder = " 아이디"
        case pwTF:
            placeholder = " 비밀번호"
        default:
            break
        }
        
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : CustomColor().tfPlaceholderColor])
        tf.font = CustomFont().title_main
        tf.textColor = CustomColor().textColor
        
        tf.delegate = self
    }
    

    // 로그인
    
    
    // 회원가입
    
    
    // 비밀번호 찾기
    
    
    
    // 비밀번호 초기화
    
    
    func keyboardSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        view.frame.origin.y = -80
//        contentView.frame.origin.y = -100
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        view.frame.origin.y = 0
//        contentView.frame.origin.y = 0
    }
    
    func tapBackground() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

