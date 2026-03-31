# Project Init

- Project name: CCQ Scenario Trainer
- Slug: ccq-scenario-trainer
- Project type: app (iOS) + web prototype
- Main objective: learners answer simple CCQs based on UI scenarios built from a target English expression.
- Initial mode guess: works-now
- Needs Stitch: no
- Needs verify loop: yes

## Milestone 1 (MVP) — CCQ Scenario Trainer
- 목표: 학습자가 하나의 target expression에 대해 시나리오를 읽고 3~5개의 CCQs에 답한 뒤 즉시 피드백을 받는 전체 사이클을 iOS SwiftUI 앱으로 구현.

### 현재 진행/완료 항목
- 문서
  - product-synopsis.md 작성 완료
  - acceptance-criteria.md 작성 완료
  - ux-scenarios.md 작성 완료
  - docs/index.md(랜딩) 추가
- iOS 개발 관련
  - src/ContentView.swift 작성(샘플 UI)
  - src/CCQApp.swift(App entry) 작성
  - Config/Info.plist 작성 (CFBundleExecutable: $(EXECUTABLE_NAME))
  - project.yml 작성 및 xcodegen으로 ccq-scenario-trainer.xcodeproj 생성
  - create_xcodeproj.sh 스크립트 추가
- 웹 관련
  - web/ Vite + React 앱 로컬 동작 확인 (localhost:5173)
  - vite.config.ts에 base 설정 적용
  - dist 빌드 완료 및 gh-pages로 배포(퍼블리시 확인)

### 남은 주요 리스크
- iOS: Info.plist / PRODUCT_NAME / EXECUTABLE_NAME 불일치로 인한 시뮬레이터 설치 실패 가능
- CCQ 데이터: 문항 메타데이터의 검증/QA 프로세스 미완료
- Web: 경로(base) 혹은 자산 404 이슈 (이미 base 적용, 재배포 권장)

### 다음 작업 (단계별)
- T1: iOS 빌드 안정화 (Product Name 고정, INFOPLIST_FILE 확인, 서명 설정)
- T2: CI 추가 (GitHub Actions) — web 자동 배포 또는 iOS 테스트 파이프라인
- T3: CCQ 데이터 모델 및 QA 프로세스 정립
- T4: 사용자 테스트를 위한 간단 분석/피드백 기록 로컬 저장소 설계

Owner: (할당 필요)
Target date: (YYYY-MM-DD)