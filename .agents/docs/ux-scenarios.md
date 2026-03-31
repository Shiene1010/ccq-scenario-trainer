# UX Scenarios — Milestone 1 (MVP)

## Primary scenario — Learner completes one CCQ cycle
1. 화면: Target Expression(최상단) + 간단 시나리오(텍스트/이미지) 표시.
2. 화면: 첫 CCQ 텍스트 표시 + 응답 버튼(Yes / No) 또는 선택지.
3. 사용자가 버튼을 탭하면:
   - 즉시 피드백 표시(정답/오답) + 1–2문장의 간단 설명.
   - 다음 질문으로 자동 전환(또는 '다음' 버튼).
4. 마지막 질문 후 요약 화면:
   - Score (예: 2/3), 간단한 설명, "Restart" 버튼 또는 "Next lesson" 제안.
5. 조건:
   - 모든 전환은 0.5–1.0초 내 사용자 인식 가능한 응답을 제공해야 함.

### 예시 컨텐츠
- Target: "I wish I might've taken a taxi last night."
- Scenario: "He missed his bus and considered getting a taxi but decided not to."
- CCQs:
  1. "Did he take a taxi?" → No
  2. "Did he regret not taking a taxi?" → Yes
  3. "Is this sentence in past perfect?" → No

## Edge cases / alternative flows
- 사용자가 입력을 빠르게 연속 탭: 버튼 비활성화/디바운스 처리 필요.
- CCQ가 텍스트 입력인 경우 빈 입력 제출 방지 + 최소 문자수 알림.
- 메타데이터 누락: QA 표시 후 관리자 화면이나 로그로 전송.

## QA 체크리스트 (디자인/개발용)
- [ ] 각 CCQ에 correctAnswer 메타 포함
- [ ] 피드백 텍스트 2줄 이내로 간결화
- [ ] 오프라인에서 마지막 세션 복원 동작 확인
- [ ] VoiceOver 라벨, 버튼 순서 검증
- [ ] 반응성: iPhone SE ~ 14 화면 테스트
