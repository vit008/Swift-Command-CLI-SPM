## Setting Up the Project Locally

To prepare the project on your computer for development with Xcode, follow these steps:

### Prerequisites
- **Xcode**: v16.3
- **Mise**

Step-by-Step Setup
1. Clone the Repository
2. Install Mise, tuist - https://docs.tuist.dev/en/guides/quick-start/install-tuist
3. Open Terminal in Project Root
	Navigate to the root directory of the project in your terminal. You should see the Tuist.swift file in this directory:
	ls  # Verify Tuist.swift is present
4. Install Project Dependencies
	Run the following command to install the necessary Tuist dependencies:
	tuist install
5. Generate the Xcode Project
	Use Tuist to generate the Xcode project and workspace:
	tuist generate

	This command will create the necessary Xcode project files based on the Project.swift configuration.