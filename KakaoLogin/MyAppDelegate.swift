//
//  MyAppDelefate.swift
//  KakaoLogin
//
//  Created by 강대민 on 2023/03/14.
//

import Foundation
import UIKit
import KakaoSDKCommon
import KakaoSDKAuth


//Auth관련해서 SwiftuiApp의 코드를 제공하지 않는 코드를 사용할때는 Delegate를 이렇게 만들어 줘야한다.
class MyAppDelegate: UIResponder, UIApplicationDelegate {
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
        
        print("카카오앱키 : \(kakaoAppKey)")
        
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                return AuthController.handleOpenUrl(url: url)
            }

            return false
        }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        let sceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = MySceneDelegate.self 
        
        return sceneConfiguration
        
    }
    
}

