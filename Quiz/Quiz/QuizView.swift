import SwiftUI

struct QuizView: View {
    @Binding var currentScreen: Screen
    @Binding var score: Int
    @Binding var totalQuestions: Int
    
    // ここにクイズの問題と選択肢、正解を定義します
    let quizItems: [QuizItem] = [
        QuizItem(
            question: "∫₀^{∞} x / (e^{x} − 1) dx の値として正しいものを選べ。",
            options: ["π²/6", "π²/12", "π²/3"],
            correctAnswerIndex: 0
        ),

        QuizItem(
            question: "f(z) = z e^{z} / (1 − cos z) の z = 0 における留数 Res(f, 0) は？",
            options: ["1", "2", "1/2"],
            correctAnswerIndex: 1
        ),

        QuizItem(
            question: "固有値が 1, 4 の実対称行列 A に対し B = 3I₂ − A とおく。det B の値は？",
            options: ["−2", "5", "7"],
            correctAnswerIndex: 0
        ),

        QuizItem(
            question: "対称群 S₅ の置換 σ = (1 2 3)(4 5) の位数はいくつか？",
            options: ["5", "6", "8"],
            correctAnswerIndex: 1
        ),

        QuizItem(
            question: "確率変数 X ~ Poisson(λ = 2) に対し Pr(X = 0) は？",
            options: ["e^{−2}", "2 e^{−2}", "e^{−1}"],
            correctAnswerIndex: 0
        ),

    ]
    
    @State private var currentQuestionIndex = 0
    @State private var isCorrect: Bool = false
    @State private var isShowingFeedback = false
    
    var currentQuestion: QuizItem {
        quizItems[currentQuestionIndex]
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Apple Quiz")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.white))
                    .padding(.top, 20)
                
                Spacer()
                
                // Question Text
                Text(currentQuestion.question)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(minHeight: 100, alignment: .center)
                
                Spacer()
                // Feedback Message Area
                Text(isCorrect ? "正解！" : "不正解... 正解は「\(currentQuestion.options[currentQuestion.correctAnswerIndex])」")
                    .font(.headline)
                    .padding(10)
                    .background(.thinMaterial)
                    .foregroundStyle(Color(isCorrect ? .green : .red))
                    .clipShape(.rect(cornerRadius: 10))
                    .opacity(isShowingFeedback ? 1 : 0)
                
                Spacer()
                
                // Answer Options
                VStack(spacing: 16) {
                    ForEach(0..<currentQuestion.options.count, id: \.self) { index in
                        Button {
                            answerTapped(index)
                        } label: {
                            Text(currentQuestion.options[index])
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color(.background))
                                .frame(maxWidth: .infinity, minHeight: 70)
                                .background(.white)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                        .disabled(isShowingFeedback)
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            // QuizViewが表示された際に、問題総数をContentViewに伝える
            totalQuestions = quizItems.count
        }
    }
    // ボタンがタップされたときの処理
    func answerTapped(_ index: Int) {
        isShowingFeedback = true
        
        if index == currentQuestion.correctAnswerIndex {
            isCorrect = true
            score += 1
        } else {
            isCorrect = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            isShowingFeedback = false
            
            if currentQuestionIndex < quizItems.count - 1 {
                currentQuestionIndex += 1
                isShowingFeedback = false
            } else {
                currentScreen = .result
            }
        }
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var currentScreen: Screen = .quiz
    @Previewable @State var score: Int = 0
    @Previewable @State var totalQuestions: Int = 5
    ZStack {
        Color(.background)
            .ignoresSafeArea()
        QuizView(
            currentScreen: $currentScreen,
            score: $score,
            totalQuestions: $totalQuestions
        )
    }
}

