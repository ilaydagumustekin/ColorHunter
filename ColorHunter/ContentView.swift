import SwiftUI

struct ContentView: View {

    @State private var score = 0
    
    @State private var timeRemaining = 8
    @State private var timer: Timer?

    @AppStorage("highScore") private var highScore = 0

    @State private var correctIndex = Int.random(in: 0..<16)
    @State private var baseHue = Double.random(in: 0...1)
    @State private var baseSaturation = Double.random(in: 0.75...0.95)
    @State private var baseBrightness = Double.random(in: 0.65...0.9)


    @State private var showAlert = false

    private let columns = Array(repeating: GridItem(.flexible()), count: 4)

    var body: some View {
        
        let totalTime = levelTime()

        VStack {
            
            ProgressView(
                value: Double(timeRemaining),
                total: Double(totalTime)
            )
            .tint(
                timeRemaining > totalTime / 2
                ? .green
                : timeRemaining > totalTime / 4
                ? .orange
                : .red
            )
            .scaleEffect(x: 1, y: 3, anchor: .center)
            .padding(.horizontal)
            .padding(.top, 20)
            .padding(.bottom, 20)   // ← Bunu ekle

            Text("Score: \(score)")
                .font(.title3)

            Spacer()

            LazyVGrid(columns: columns, spacing: 15) {

                ForEach(0..<16, id: \.self) { index in

                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            Color(
                                hue: baseHue,
                                saturation: baseSaturation,
                                brightness: index == correctIndex
                                    ? min(baseBrightness + brightnessDifference(), 1.0)
                                    : baseBrightness
                            )
                        )
                        .frame(width: 75, height: 75)
                        .onTapGesture {

                            if index == correctIndex {

                                score += 1

                                if score > highScore {
                                    highScore = score
                                }

                                correctIndex = Int.random(in: 0..<16)
                                
                                baseHue = Double.random(in: 0...1)
                                baseSaturation = Double.random(in: 0.75...0.95)
                                baseBrightness = Double.random(in: 0.20...0.55)
                                
                                startTimer()
                                
                            } else {

                                timer?.invalidate()
                                showAlert = true
                            }
                        }
                }
            }
            .padding()

            Spacer()

            Text("Highscore: \(highScore)")
                .font(.title3)

            Spacer()

        }
        .padding()
        .onAppear {
            startTimer()
        }

        .alert("Oyun Bitti", isPresented: $showAlert) {

            Button("Evet") {

                restartGame()

            }

            Button("Hayır", role: .cancel) { }

        } message: {

            Text("""
            Skorun: \(score)

            Tekrar oynamak istiyor musun?
            """)

        }
    }

    func brightnessDifference() -> Double {

        switch score {

        case 0...5:
            return 0.45

        case 6...10:
            return 0.32

        case 11...20:
            return 0.22

        case 21...35:
            return 0.14

        case 36...50:
            return 0.08

        default:
            return 0.04
        }
    }
    
    func levelTime() -> Int {

        switch score {

        case 0...2:
            return 10

        case 3...5:
            return 9

        case 6...8:
            return 8

        case 9...11:
            return 7

        case 12...14:
            return 6

        case 15...17:
            return 5

        default:
            return 4
        }
    }
    
    func startTimer() {

        timer?.invalidate()

        timeRemaining = levelTime()

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in

            if timeRemaining > 0 {

                timeRemaining -= 1

            } else {

                timer?.invalidate()
                showAlert = true
            }
        }
    }
    
    func restartGame() {

        score = 0

        correctIndex = Int.random(in: 0..<16)

        baseHue = Double.random(in: 0...1)
        baseSaturation = Double.random(in: 0.75...0.95)
        baseBrightness = Double.random(in: 0.20...0.55)
        
        startTimer()
    }}

#Preview {
    ContentView()
}
