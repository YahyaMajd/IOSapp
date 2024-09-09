import SwiftUI
import FirebaseAuth

struct MainJobView: View {
    @Binding var isUserLoggedIn: Bool  // This binding tracks login status

    var body: some View {
        VStack {
            Text("Welcome to the Job Tracker!")
                .font(.largeTitle)
                .padding()

            // Add other content related to job tracking here

            Spacer()

            // Logout button
            Button(action: {
                logoutUser()
            }) {
                Text("Log Out")
                    .bold()
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Main Job Tracker")
    }

    func logoutUser() {
        do {
            try Auth.auth().signOut()
            // Update the state to indicate the user is logged out
            print("User signed out successfully.")
            isUserLoggedIn = false
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }

}
