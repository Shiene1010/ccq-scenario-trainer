# Project Init

- Project name: CCQ Scenario Trainer
- Slug: ccq-scenario-trainer
- Project type: app
- Main objective: Build a service that helps learners answer simple CCQ responses based on UI scenarios built from a target English expression.
- Initial mode guess: works-now
- Needs Stitch: no
- Needs verify loop: yes
- Main risks: CCQs may become vague instead of meaning-checking; learner answers may be judged inconsistently; scenario UI may test sentence details instead of the target meaning.
- First milestone: Deliver an MVP flow where a learner sees one target expression such as "I wish I might've taken a taxi last night.", reads a short CCQ-based scenario, answers 3 to 5 simple CCQs in the UI with short responses like yes, no, or brief choice answers, and receives immediate feedback on whether the answers match the intended meaning of the target expression.

## Milestone 1 (MVP) — CCQ Scenario Trainer
- 목표: 학습자가 하나의 target expression에 대해 시나리오를 읽고 3~5개의 CCQs에 답한 뒤 즉시 피드백을 받는 전체 사이클을 iOS SwiftUI 앱으로 구현.
- 성공 기준:
  - 한 사이클 완료 시간 < 2분
  - 검증된 CCQ에서 자동 채점 정답률 90% 이상
  - iOS SwiftUI 네이티브 앱 (iPhone 14+)
  - 다크/라이트 모드, 오프라인 우선 지원
- 작업:
  - T0: product-synopsis.md 검토 및 UX 시나리오 고정 (.agents/docs/ux-scenarios.md)
  - T1: 수용기준 정리 (.agents/docs/acceptance-criteria.md)
  - T2: Xcode 프로젝트 및 SwiftUI 뷰 스캐폴드 생성 (src/)
  - T3: 로컬 데이터/오프라인 저장 설계 (UserDefaults/파일/CoreData)
  - T4: 단위 테스트 작성 및 실행 (tests/)
- 소유자: (할당 필요)
- 목표일: (YYYY-MM-DD)