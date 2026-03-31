# CCQ Scenario Trainer

간단한 시작 가이드

개발 환경 (권장)
- macOS, Xcode 14+
- Swift 5.7+, SwiftUI

빠른 시작
1. Xcode에서 새 iOS App 생성 (SwiftUI).
2. 이 리포지토리의 src/ContentView.swift 내용을 Xcode의 ContentView.swift로 교체.
3. 빌드 및 시뮬레이터에서 실행 (iPhone 14 추천).

테스트
- Xcode에서 테스트 타깃을 생성 후 tests/의 테스트 파일 추가 및 실행.

프로젝트 구조 제안
- src/ : SwiftUI 뷰 및 비즈니스 로직
- tests/ : XCTest 단위 테스트
- .agents/ : 프로젝트 메타·워크플로우 문서
