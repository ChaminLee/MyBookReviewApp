//
//  AddBookViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2021/02/08.
//

import UIKit
import Firebase
import SnapKit

// present modal로
class AddBookViewController: UIViewController, UITextFieldDelegate {
     
//    let scrollView = UIScrollView()

    let titleInput = UITextField(frame: CGRect(x: 10, y: 320, width: 300.0, height: 30.0))
    let authorInput = UITextField(frame: CGRect(x: 10, y: 320, width: 300.0, height: 30.0))
    let dateInput = UITextField(frame: CGRect(x: 10, y: 320, width: 300.0, height: 30.0))
    
    var titleList = [String]()
    var authorList = [String]()
    var dateList = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor().defaultBackgroundColor
        addTopTitle()
//        setupScrollView()
        contentsConfigure()
 
        keyboardSetup()
        hideKeyboardWhenTappedAround()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 700)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

//    func setupScrollView() {
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(scrollView)
//
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//        ])
//    }
   
    
    // Button Control
    let imgAddButton : UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        bt.imageView?.contentMode = .scaleAspectFit
        bt.imageEdgeInsets = UIEdgeInsets(top: 40.0, left: 40.0, bottom: 40.0, right: 40.0)
        bt.tintColor = CustomColor().textColor
        bt.addTarget(self, action: #selector(btnTouched), for: .touchUpInside)
        
        return bt
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
    
    let doneButton : UIButton = {
        let bt = UIButton()
        bt.setTitle("완료", for: .normal)
        bt.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        bt.setTitleColor(CustomColor().textColor, for: .normal)
        
        // need to change #selector
        bt.addTarget(self, action: #selector(complete), for: .touchUpInside)
        
        return bt
    }()
    
    @objc func btnTouched() {
        print("Image Clicked")
        print("titleList : \(titleList)")
        print("authorList : \(authorList)")
        print("dateList : \(dateList)")
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 수정 필요
    
    var cnt = 0
    @objc func complete() {
        let titleData = titleInput.text!
        let authorData = authorInput.text!
        let dateData = dateInput.text!
//        let key = FirebaseDB.dbref.childByAutoId().key
        let imgData = "보통의 존재.png"
        
        if titleData != "" && authorData != "" && dateData != "" {
            let data = ["title": titleData,"author": authorData,"date": dateData, "image" : imgData]
            FirebaseDB.dbref.child("0/bookList/\(cnt)").setValue(data)
            cnt += 1
        }
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // Text Controll
    let titleText : UILabel = {
        let lb = UILabel()
        lb.text = "책 제목"
        lb.font = UIFont(name: "Helvetica-Bold", size: 20)
        lb.textColor = CustomColor().textColor
        
        return lb
    }()
    
    let authorText : UILabel = {
        let lb = UILabel()
        lb.text = "저자"
        lb.font = UIFont(name: "Helvetica-Bold", size: 20)
        lb.textColor = CustomColor().textColor
        
        return lb
    }()
    
    let dateText : UILabel = {
        let lb = UILabel()
        lb.text = "읽기 시작한 날"
        lb.font = UIFont(name: "Helvetica-Bold", size: 20)
        lb.textColor = CustomColor().textColor
        
        return lb
    }()

    func createToolbar() -> UIToolbar {
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done bt
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        

        return toolbar
    }
    
    let datePicker = UIDatePicker()
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        dateInput.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko")
        dateInput.inputAccessoryView = createToolbar()
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ko")
        
        self.dateInput.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func contentsConfigure() {
        titleInput.backgroundColor = CustomColor().defaultBackgroundColor
        titleInput.addBottomBorder()
        titleInput.textColor = CustomColor().textColor
        
        titleInput.attributedPlaceholder = NSAttributedString(string: "책 제목을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 10)!])
        
        authorInput.backgroundColor = CustomColor().defaultBackgroundColor
        authorInput.addBottomBorder()
        authorInput.textColor = CustomColor().textColor
        
        authorInput.attributedPlaceholder = NSAttributedString(string: "작가명을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 10)!])
        
        dateInput.backgroundColor = CustomColor().defaultBackgroundColor
        dateInput.addBottomBorder()
        dateInput.textColor = CustomColor().textColor
        
        dateInput.attributedPlaceholder = NSAttributedString(string: "읽기 시작한 일자를 선택해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 10)!])
        
        createDatePicker()
        
        titleInput.delegate = self
        authorInput.delegate = self
        dateInput.delegate = self
        
        titleInput.tag = 1
        authorInput.tag = 2
        dateInput.tag = 3

        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(15)
        }
        
        doneButton.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.top)
            $0.right.equalToSuperview().offset(-15)
        }
        
        imgAddButton.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
        }
        
        titleText.snp.makeConstraints {
            $0.top.equalTo(imgAddButton.snp.bottom).offset(140)
            $0.left.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        titleInput.snp.makeConstraints {
            $0.top.equalTo(titleText.snp.bottom).offset(5)
            $0.left.equalTo(titleText.snp.left)
            $0.width.equalTo(300)
        }
        
        authorText.snp.makeConstraints {
            $0.top.equalTo(titleInput.snp.bottom).offset(20)
            $0.left.equalTo(titleText.snp.left)
            $0.height.equalTo(50)
        }
        
        authorInput.snp.makeConstraints {
            $0.top.equalTo(authorText.snp.bottom).offset(5)
            $0.left.equalTo(authorText.snp.left)
            $0.width.equalTo(300)
        }
        
        dateText.snp.makeConstraints {
            $0.top.equalTo(authorInput.snp.bottom).offset(20)
            $0.left.equalTo(authorInput.snp.left)
            $0.height.equalTo(50)
        }
        
        dateInput.snp.makeConstraints {
            $0.top.equalTo(dateText.snp.bottom).offset(5)
            $0.left.equalTo(dateText.snp.left)
            $0.width.equalTo(300)
        }
    }
    
    
    func keyboardSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        view.frame.origin.y = -50
//        contentView.frame.origin.y = -100
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        view.frame.origin.y = 0
//        contentView.frame.origin.y = 0
    }
    

}


extension AddBookViewController {
    func addTopTitle() {
        let label : UILabel = {
            let lb = UILabel()
            lb.text = "기록하기"
            lb.textColor = UIColor.white
            
            return lb
        }()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: CustomColor().textColor]
        
        self.navigationController?.navigationBar.topItem?.title = label.text
//        self.navigationController?.navigationBar.barTintColor = CustomColor().defaultBackgroundColor
        

    }
}

extension AddBookViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddBookViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = CustomColor().textColor.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}


