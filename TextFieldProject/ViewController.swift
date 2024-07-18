//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Nam on 7/16/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {   //  델리게이트 삽입

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField.delegate = self   //  대리자 지정
        
        setUp()
        
    }

    func setUp() {
        view.backgroundColor = UIColor.purple //  기본적인 앱의 백그라운드 색깔 변경
        textField.keyboardType = UIKeyboardType.emailAddress    //  키보드 타입 변경
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect    // 텍스트 필드 외곽선 스타일
        textField.clearButtonMode = .always //  입력값 전체 삭제 버튼
        textField.returnKeyType = .go   // return 버튼 변경
        
        
        textField.becomeFirstResponder()    //  텍스트필드가 첫번째로 반응하는 메서드 -> 화면 진입하면 키보드가 올라옴
        
    }
    
    //  텍스트 필드의 입력을 시작할 때 호출 (시작할지 말지의 여부 허락)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 입력을 시작하면 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("유저가 입력 시작")
        print(#function)    // 함수 이름 호출
    }
    
    // 클리어 버튼을 누르면 동작
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Clear 버튼")
        print(#function)    // 함수 이름 호출
        return true
    }
    
    // 텍스트필드 글자 내용이 한글자 입력되거나 지워질 때마다 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        print(#function)    // 함수 이름 호출
        
        if Int(string) != nil {         // 숫자는 입력되지 않는 코드
            return false
        } else {
            //  10글자 이상 입력되는 것을 막는 코드
            if(textField.text?.count)! + string.count > 10 {
                return false
            } else {
                return true
            }
        }
    }
    
    // 엔터키 입력 시 다음 동작 허락 여부
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)    // 함수 이름 호출
        if textField.text == ""{
            textField.placeholder = "Type Something"
            return false
        } else {
            return true
        }
    }
    
    // 텍스트 필드 입력이 끝날 때 중단할지의 여부 결정
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)    // 함수 이름 호출
        return true
    }
    
    // 텍스트 필드 입력이 끝날 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)    // 함수 이름 호출
        print("입력 종료")
    }
    
    
    //  Done 버튼 액션 함수
    @IBAction func btnDoneTapped(_ sender: UIButton) {
        textField.resignFirstResponder()    //  키보드가 내려감
        textField.text = "" //  텍스트필드 공백으로 변경
    }
    
    //  터치가 일어나면 뷰를 종료  (화면에 탭을 감지하는 메서드)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
//        textField.resignFirstResponder()
    }
    
}

