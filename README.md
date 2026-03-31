# CCQ Scenario Trainer

간단 개요
- 목표: 학습자가 타겟 문장을 보고 3–5개의 CCQ에 답하고 즉시 피드백을 받는 iOS 앱(MVP) 및 간단한 웹 프로토타입.
- 리포: https://github.com/Shiene1010/ccq-scenario-trainer

현재 상태 요약
- iOS
  - src/ 에 SwiftUI 샘플 뷰(ContentView.swift) 및 App 진입점(CCQApp.swift) 존재.
  - xcodegen용 project.yml 및 Config/Info.plist 작성.
  - ccq-scenario-trainer.xcodeproj(xcodegen 생성) 생성됨.
- 웹
  - web/ 에 Vite + React 앱(로컬: http://localhost:5173) 존재.
  - vite.config.ts에 base 설정(/ccq-scenario-trainer/) 적용.
  - dist 폴더 빌드 완료, gh-pages로 배포(페이로드 확인됨).
- 문서
  - PROJECT_INIT.md, .agents/docs/*(acceptance-criteria.md, ux-scenarios.md, product-synopsis.md) 업데이트됨.
  - docs/index.md(프로젝트 랜딩) 추가됨.

빠른 시작
- iOS (Xcode)
  1. 루트로 이동: cd /Users/mini/Desktop/my-first-app
  2. xcodeproj 재생성(필요 시): xcodegen generate --spec project.yml
  3. Xcode 열기: open ccq-scenario-trainer.xcodeproj
  4. Target → Signing 설정 후 시뮬레이터(iPhone 14)로 빌드

- Web (로컬)
  1. cd web
  2. npm ci
  3. npm run dev    # 개발 서버 (기본: 5173)
  4. npm run build  # 프로덕션 빌드 → dist 생성

- Web (GitHub Pages 배포)
  1. web/vite.config.ts에 `base: '/ccq-scenario-trainer/'` 설정 확인
  2. cd web && npm ci && npm run build
  3. npx gh-pages -d dist   # 또는 package.json의 predeploy/deploy 스크립트 사용

주요 파일 위치
- iOS: src/ (ContentView.swift, CCQApp.swift), Config/Info.plist
- xcodegen spec: project.yml, create_xcodeproj.sh
- Web: web/ (package.json, vite.config.ts, src/)
- 문서: PROJECT_INIT.md, docs/index.md, .agents/docs/

남은 작업(우선순위)
1. iOS: Product Name / Info.plist / Signing 확정 후 기기/시뮬레이터 빌드 문제 해결
2. Web: CI (GitHub Actions) 자동 배포 설정 또는 Vercel 연동
3. 테스트: XCTest 타깃 모듈명 정리 및 CI 통합
4. QA: CCQ 데이터 검증 파이프라인 정의

문의나 추가 자동화(예: GH Actions 워크플로 추가, Vercel 세팅, iOS 빌드 로그 분석)가 필요하면 지시해 주세요.
