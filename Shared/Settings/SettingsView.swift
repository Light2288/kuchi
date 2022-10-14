import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @AppStorage("numberOfQuestions") var numberOfQuestions = 6
    @State var learningEnabled: Bool = true
    @AppStorage("dailyReminderEnabled") var dailyReminderEnabled = false
    @State var dailyReminderTime = Date(timeIntervalSince1970: 0)
    @AppStorage("dailyReminderTime") var dailyReminderTimeShadow: Double = 0
    @State var cardBackgroundColor: Color = .red
    @AppStorage("appearance") var appearance: Appearance = .automatic
    
    // MARK: - Body
    var body: some View {
        List {
            Text("Settings")
                .font(.largeTitle)
                .padding(.bottom, 8)
            Section {
                VStack(alignment: .leading) {
                    Picker("", selection: $appearance) {
                        ForEach(Appearance.allCases) { appearance in
                            Text(appearance.name).tag(appearance)
                        }
                    }
                    .pickerStyle(.segmented)
                    ColorPicker(selection: $cardBackgroundColor) {
                        Text("Card background color")
                    }
                }
            } header: {
                Text("Appearance")
            }
            Section {
                VStack(alignment: .leading) {
                    Stepper("Number of questions: \(numberOfQuestions)",
                            value: $numberOfQuestions,
                            in: 3...20)
                    Text("Any change will affect the next game")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Toggle(isOn: $learningEnabled) {
                    Text("Learning enabled")
                }
            } header: {
                Text("Game")
            }
            Section {
                HStack {
                    Toggle(isOn: $dailyReminderEnabled) {
                        Text("Daily reminder")
                    }
                    .onChange(of: dailyReminderEnabled, perform: { _ in configureNotification()})
                    DatePicker("", selection: $dailyReminderTime, displayedComponents: .hourAndMinute)
                        .disabled(!dailyReminderEnabled)
                        .onChange(of: dailyReminderTime, perform: { newValue in
                            dailyReminderTimeShadow = newValue.timeIntervalSince1970
                            configureNotification() })
                        .onAppear {
                            dailyReminderTime = Date(timeIntervalSince1970: dailyReminderTimeShadow)
                        }
                }
            } header: {
                Text("Notifications")
            }

        }
    }
    
    func configureNotification() {
        if dailyReminderEnabled {
            LocalNotifications.shared.createReminder(time: dailyReminderTime)
        } else {
            LocalNotifications.shared.deleteReminder()
        }
    }
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
