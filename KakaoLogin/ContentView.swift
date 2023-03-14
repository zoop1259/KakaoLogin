//
//  ContentView.swift
//  KakaoLogin
//
//  Created by 강대민 on 2023/03/14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var kakaoAuthVM : KakaoAuthViewModel = KakaoAuthViewModel()
    
    let loginStatusInfo : (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "로그인 상태" : "로그아웃 상태"
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(loginStatusInfo(kakaoAuthVM.isLoggedIn))
            
            Button("카카오 로그인") {
                kakaoAuthVM.handleKakaoLogin()
            }
            
            Button("카카오 로그아웃") {
                kakaoAuthVM.kakaoLogout()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
