//
//  KakaoLoginApp.swift
//  KakaoLogin
//
//  Created by 강대민 on 2023/03/14.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct KakaoLoginApp: App {
    
    //MyAppDelegate처럼 만들어서 사용하게 된다면 아래코드처럼 사용하면된다.
    @UIApplicationDelegateAdaptor var appDelegate : MyAppDelegate
    
    
    //SwiftuiAPP에서 사용하는 코드는 로그인을 위한 설정에서는 제공하지 않고 있기 떄문에 아직까지는 Delegate파일을 만들어야한다.
//    init() {
//        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
//        // Kakao SDK 초기화
//        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
