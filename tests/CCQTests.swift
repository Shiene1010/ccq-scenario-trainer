import XCTest
@testable import ccq_scenario_trainer  // 필요하면 실제 모듈명으로 변경

final class CCQTests: XCTestCase {
    func testScoringLogic() {
        // 모델화된 세션이 있을 경우 테스트 예시
        let ccqs = [
            CCQ(text: "Q1", correctAnswer: true, explanation: nil),
            CCQ(text: "Q2", correctAnswer: false, explanation: nil)
        ]
        let session = CCQSession(target: "t", scenario: "s", ccqs: ccqs)
        XCTAssertEqual(session.score, 0)
        session.answer(true)
        XCTAssertEqual(session.score, 1)
        session.answer(false)
        XCTAssertEqual(session.score, 2) // both correct
    }
}