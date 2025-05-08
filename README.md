## Swift-Command-CLI-SPM

This repository includes examples of how to create Swift-based CLI commands.


## Setting Up the Project Locally

To prepare the project on your computer for development with Xcode, follow these steps:

### Prerequisites

- **Xcode**: v16.3
- **Mise** A tool for managing runtime versions. Install it from [mise.jdx.dev](https://mise.jdx.dev/getting-started.html).

### Step-by-Step Setup

1. **Clone the Repository**

2. **Install Mise and Tuist**  
	Install Tuist using Mise by following the [Tuist installation guide](https://docs.tuist.dev/en/guides/quick-start/install-tuist). Ensure Mise is properly configured.
 
3. **Open Terminal in Project Root**
	Navigate to the root directory of the project in your terminal. You should see the `Tuist.swift` file in this directory:
	```bash
	ls  # Verify Tuist.swift is present
	```

4. **Install Project Dependencies**
	Run the following command to install the necessary Tuist dependencies:
	```bash
	tuist install
	```

5. **Generate the Xcode Project**
	Use Tuist to generate the Xcode project and workspace:
	```bash
	tuist generate
	```

	This command creates the necessary Xcode project files based on the `Project.swift` configuration.


