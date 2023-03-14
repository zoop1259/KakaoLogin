//
//  MySceneDelegate.swift
//  KakaoLogin
//
//  Created by 강대민 on 2023/03/14.
//

import UIKit
import KakaoSDKAuth


class MySceneDelegate: UIResponder, UIWindowSceneDelegate {
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
}
