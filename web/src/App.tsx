import { useState } from 'react'

interface CCQ {
  id: number;
  question: string;
  correctAnswer: boolean;
  explanation: string;
}

interface Scenario {
  target: string;
  scenario: string;
  questions: CCQ[];
}

const SAMPLE_DATA: Scenario = {
  target: "I wish I might've taken a taxi last night.",
  scenario: "He missed his bus and considered getting a taxi but decided not to. He arrived home very late and tired.",
  questions: [
    {
      id: 1,
      question: "Did he take a taxi?",
      correctAnswer: false,
      explanation: "No, he decided not to take a taxi."
    },
    {
      id: 2,
      question: "Did he regret not taking a taxi?",
      correctAnswer: true,
      explanation: "Yes, 'I wish I might've' implies regret about a past action."
    },
    {
      id: 3,
      question: "Is this sentence in past perfect?",
      correctAnswer: false,
      explanation: "It uses 'might have + past participle', but with 'wish', it expresses a past hypothetical regret."
    }
  ]
}

function App() {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [score, setScore] = useState(0);
  const [showResult, setShowResult] = useState(false);
  const [feedback, setFeedback] = useState<{ isCorrect: boolean; message: string } | null>(null);

  const currentQuestion = SAMPLE_DATA.questions[currentIndex];

  const handleAnswer = (answer: boolean) => {
    const isCorrect = answer === currentQuestion.correctAnswer;
    if (isCorrect) setScore(s => s + 1);

    setFeedback({
      isCorrect,
      message: currentQuestion.explanation
    });

    setTimeout(() => {
      setFeedback(null);
      if (currentIndex < SAMPLE_DATA.questions.length - 1) {
        setCurrentIndex(c => c + 1);
      } else {
        setShowResult(true);
      }
    }, 2000);
  };

  const restart = () => {
    setCurrentIndex(0);
    setScore(0);
    setShowResult(false);
    setFeedback(null);
  };

  return (
    <div className="stitch-container">
      <header>
        <h1 style={{ textAlign: 'center', color: '#1a1b26' }}>CCQ Stitch Edition</h1>
      </header>

      {!showResult ? (
        <main className="stitch-card">
          <span className="target-expression">{SAMPLE_DATA.target}</span>
          <p className="scenario-text">{SAMPLE_DATA.scenario}</p>
          
          <hr style={{ border: 'none', borderTop: '2px dashed #e2e8f0', margin: '2rem 0' }} />

          <div style={{ textAlign: 'center' }}>
            <p style={{ fontSize: '1.2rem', fontWeight: 600 }}>{currentQuestion.question}</p>
            <div className="button-group">
              <button 
                className="stitch-button" 
                onClick={() => handleAnswer(true)}
                disabled={feedback !== null}
              >
                Yes
              </button>
              <button 
                className="stitch-button" 
                onClick={() => handleAnswer(false)}
                disabled={feedback !== null}
              >
                No
              </button>
            </div>

            {feedback && (
              <div className={`feedback ${feedback.isCorrect ? 'correct' : 'incorrect'}`}>
                {feedback.isCorrect ? '✨ Correct!' : '❌ Incorrect'}
                <p style={{ fontSize: '0.9rem', marginTop: '0.5rem', fontWeight: 400 }}>{feedback.message}</p>
              </div>
            )}
          </div>
          
          <div style={{ marginTop: '2rem', textAlign: 'right', color: '#94a3b8', fontSize: '0.9rem' }}>
            Question {currentIndex + 1} of {SAMPLE_DATA.questions.length}
          </div>
        </main>
      ) : (
        <main className="stitch-card" style={{ textAlign: 'center' }}>
          <h2>Learning Complete! 🎯</h2>
          <div className="score-display">
            {score} / {SAMPLE_DATA.questions.length}
          </div>
          <p style={{ margin: '1.5rem 0', color: '#64748b' }}>
            {score === SAMPLE_DATA.questions.length 
              ? "Perfect! You've mastered this expression." 
              : "Good effort! Let's review the explanations and try again."}
          </p>
          <button className="stitch-button primary" onClick={restart}>
            Try Again
          </button>
        </main>
      )}

      <footer style={{ textAlign: 'center', marginTop: '2rem', color: '#94a3b8', fontSize: '0.8rem' }}>
        © 2026 CCQ Scenario Trainer. Stitched with love.
      </footer>
    </div>
  )
}

export default App
