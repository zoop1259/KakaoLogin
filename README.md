# KakaoLogin
login logout 구현

코드회고
------

새로 배운것
--------

NewFile -> Configuration Settings File을 활용하여 APIKey를 감추는 방법을 배움.

Kakao는 Auth를 AppLifeCycle을 사용하는 방법을 제공한다는것을 배움.
(그러나, 이 프로젝트에서는 App, Scene Delegate 둘을 생성하여 활용함.)

동시성을 활용하여 로그인, 로그아웃 상태에 적용함.
이해한대로 적어보면
Task블럭에서 해결되는 코드를 작성한 메서드에서는 func위에 @MainActor를 사용해야 된다.
async await는 조심하면 사용하긴 쉽다.
async는 리턴값이 있기 때문에 (프로젝트내에선 변수 isLoggedIn에) 직접 값을 전달 할 수 있다.


각 파일을 폴더보다 상위에 위치시키면 Commit이 안된다는걸 깨달음. 
(
xcode에서 commit했을때 다음과 같은 에러 발생
error: insufficient permission for adding an object to repository database .git/objects
error: Error building trees
) 



