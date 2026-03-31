import SwiftUI

struct CCQ: Identifiable, Codable {
    let id = UUID()
    let text: String
    let correctAnswer: Bool // true = Yes, false = No
    let explanation: String?
}

final class CCQSession: ObservableObject {
    @Published var target: String
    @Published var scenario: String
    @Published var ccqs: [CCQ]
    @Published var currentIndex: Int = 0
    @Published var score: Int = 0

    init(target: String, scenario: String, ccqs: [CCQ]) {
        self.target = target
        self.scenario = scenario
        self.ccqs = ccqs
    }

    func answer(_ a: Bool) {
        guard currentIndex < ccqs.count else { return }
        if a == ccqs[currentIndex].correctAnswer { score += 1 }
        currentIndex += 1
    }

    func restart() {
        currentIndex = 0
        score = 0
    }
}

struct ContentView: View {
    @StateObject private var session = CCQSession(
        target: "I wish I might've taken a taxi last night.",
        scenario: "He missed his bus and considered getting a taxi but decided not to.",
        ccqs: [
            CCQ(text: "Did he take a taxi?", correctAnswer: false, explanation: "He decided not to take a taxi."),
            CCQ(text: "Did he regret not taking a taxi?", correctAnswer: true, explanation: "The sentence expresses regret."),
            CCQ(text: "Is this sentence in past perfect?", correctAnswer: false, explanation: "This is a modal + past construction.")
        ]
    )
    @State private var lastFeedback: String = ""
    @State private var showFeedback: Bool = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 16) {
            Text(session.target)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.top)

            Text(session.scenario)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Spacer()

            if session.currentIndex < session.ccqs.count {
                let ccq = session.ccqs[session.currentIndex]
                Text(ccq.text)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()

                HStack(spacing: 24) {
                    Button(action: { submit(true) }) {
                        Text("Yes")
                            .frame(minWidth: 88, minHeight: 44)
                    }
                    .buttonStyle(.borderedProminent)

                    Button(action: { submit(false) }) {
                        Text("No")
                            .frame(minWidth: 88, minHeight: 44)
                    }
                    .buttonStyle(.bordered)
                }
                .accessibilityElement(children: .combine)
            } else {
                VStack(spacing: 8) {
                    Text("Completed")
                        .font(.title2)
                    Text("Score: \(session.score)/\(session.ccqs.count)")
                    Button("Restart") { session.restart(); lastFeedback = ""; showFeedback = false }
                        .padding(.top)
                }
            }

            if showFeedback {
                Text(lastFeedback)
                    .font(.footnote)
                    .padding()
                    .transition(.opacity)
            }

            Spacer()
        }
        .padding()
        .animation(.easeInOut, value: session.currentIndex)
    }

    func submit(_ answer: Bool) {
        guard session.currentIndex < session.ccqs.count else { return }
        let ccq = session.ccqs[session.currentIndex]
        if answer == ccq.correctAnswer {
            lastFeedback = "Correct. " + (ccq.explanation ?? "")
        } else {
            lastFeedback = "Incorrect. " + (ccq.explanation ?? "")
        }
        showFeedback = true
        // 짧은 지연 후 다음 문제로 이동
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            session.answer(answer)
            showFeedback = false
        }
    }
}