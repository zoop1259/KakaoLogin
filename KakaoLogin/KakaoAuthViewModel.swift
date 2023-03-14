//
//  KakaoAuthViewModel.swift
//  KakaoLogin
//
//  Created by 강대민 on 2023/03/14.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

/*
 정리해보면 Task를 사용하는 메서드에서는 @MainActor를 사용해주지않으면 쓰레드로 인해 앱이 다운될 가능성이 있다.
 async await는 조심만하면 사용하긴 쉽다.
 
 */



//VM이므로 옵저버블오브젝트
class KakaoAuthViewModel : ObservableObject {

    //호출하는것을 처리하기 위해 하나를 만든다.
    @Published var isLoggedIn : Bool = false
    
    //@MainActor를 하지 않으면 백그라운드에서 어쩌구저쩌구 확인할 방법이 없다고 보라색 느낌표가 뜬다.
    //메인쓰레드에서 가능하게 해준다.
    @MainActor
    //로그인 여부 확인
    func handleKakaoLogin() {
        //async await는 Task블럭 안에서 해야되기 떄문에 감싸준다
        Task {
            if (UserApi.isKakaoTalkLoginAvailable()) {
                //앱을 통해서 로그인 했을시
                //로그인이 성공이 되면(true,false값을 리턴하기 때문에) 그냥 isLoggedIn에 값을 넣어준다.
                isLoggedIn = await handleLoginWithKakaoTalkApp()
            } else {
                isLoggedIn = await handleLoginKakaoAccount()
            }
        }
    }
    
    //카카오톡앱을 통해 로그인.
    func handleLoginWithKakaoTalkApp() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    //카카오메일로 로그인.
    func handleLoginKakaoAccount() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                        continuation.resume(returning: false)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")

                        //do something
                        _ = oauthToken
                        continuation.resume(returning: true)
                    }
                }
        }
    }
    
    //실제로 로그아웃을 처리하는 것
    @MainActor
    func kakaoLogout() {
        //동시성은 Task 블럭에서 호출해야하기 떄문이다.
        Task {
            if await handleKakaoLogout() {
                isLoggedIn = false
            }
        }
    }
    
    
    func handleKakaoLogout() async -> Bool {
        await withCheckedContinuation({ continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        })
    }
    
    
    
    /*
     //아래 방식은 클로저 방식인데 이걸 동시성으로 바꿔본다.
    func handleKakaoLogin() {
        // 카카오톡 실행 가능(설치여부) 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            //카카오톡앱을 통해 로그인.
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
            //설치되어있지 않을때
        } else {
            //이건 카카오 계정으로 로그인되는것. (웹뷰)
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")

                        //do something
                        _ = oauthToken
                    }
                }
        }
    }
    
    
    func handleKakaoLogout() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
    */
    
    
}
