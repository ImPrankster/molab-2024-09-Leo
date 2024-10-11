import AVFoundation

class AudioPlayer: ObservableObject {
    @Published var player: AVAudioPlayer? = nil

    init() {}

    func playAddSound() {
        player = loadBundleAudio("orb.wav")
        player?.play()
    }
    func playDelSound() {
        player = loadBundleAudio("hit1.wav")
        player?.play()
    }

    func loadBundleAudio(_ fileName: String) -> AVAudioPlayer? {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            return try AVAudioPlayer(contentsOf: url)
        } catch {
            print("loadBundleAudio error", error)
        }
        return nil
    }

}
