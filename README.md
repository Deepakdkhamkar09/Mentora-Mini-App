# Mentora Mini App

Mentora is a mobile-first learning platform that connects students, parents, and mentors through structured lessons and learning sessions. This is a simplified mobile implementation built to demonstrate core product flows as part of a Mobile Developer Technical Assignment.

## Project Overview

This project is a Flutter-based implementation of the Mentora platform, showcasing how students can learn, parents can manage their children's education, and mentors can monitor progress. It emphasizes a clean architecture, reusable UI components, and a seamless user experience.

## Features

- **Authentication Flow**: Mock login system with role-based access.
- **Role-Based Navigation**: Customized dashboards and navigation stacks for Parents, Students, and Mentors.
- **Parent Student Management**: Ability for parents to register and view their children's profiles.
- **Lessons and Sessions Flow**: Browsing available subjects and deep-diving into specific learning sessions.
- **Mentor Student Monitoring**: Mentors can view their assigned students and track their learning path.

## Role-Based Functionality

### 👨‍👩‍👧 Parent

- View a list of registered students.
- Create new student profiles with credentials.
- Browse available lessons.
- View session history and specific session details.

### 🎓 Student

- Access the dashboard with personalized greetings.
- Browse available lessons and subjects.
- View detailed session summaries and insights.

### 🧑‍🏫 Mentor

- View a list of assigned students.
- Navigate from Student → Lessons → Sessions → Session Details to monitor progress.

## Application Flow

1. **Login**: Users enter credentials → System detects role (Parent/Student/Mentor).
2. **Dashboard**: Users land on their role-specific dashboard.
3. **Navigation Paths**:
   - **Parent**: Home (Students) ➔ Create Student | Lessons ➔ Sessions ➔ Session Detail.
   - **Student**: Home (Lessons) ➔ Sessions ➔ Session Detail.
   - **Mentor**: Home (Assigned Students) ➔ Lessons ➔ Sessions ➔ Session Detail.

## Screens Implemented

- **Login Screen**: Secure-entry form with role detection.
- **Parent Dashboard**: Student management hub.
- **Create Student Screen**: Form to register new student profiles.
- **Student Dashboard**: Learning-centric overview.
- **Mentor Dashboard**: Student monitoring interface.
- **Lessons List Screen**: Catalog of available subjects.
- **Sessions List Screen**: Timeline of sessions for a specific lesson.
- **Session Detail Screen**: Comprehensive breakdown of a single session (Topic, Summary, Insights).

## Project Structure

The project follows a modular and clean architecture pattern:

```text
lib/
├── core/
│   ├── constants/    # App strings and global color system
│   ├── routes/       # GetX route definitions
│   └── theme/        # Global Material UI theme
├── data/
│   ├── models/       # Data entities (User, Student, Lesson, Session)
│   └── mock/         # Mock data and logic
├── modules/          # Feature-based modules (Views & Controllers)
│   ├── auth/
│   ├── parent/
│   ├── mentor/
│   ├── student/
│   ├── lessons/
│   └── sessions/
├── widgets/          # Reusable UI components
└── main.dart         # Entry point
```

## Reusable Components

- **AppButton**: Consistent primary action button with loading states.
- **AppInput**: Standardized text input fields with validation support and visibility toggles.
- **StudentCard**: Card component for displaying student information.
- **LessonCard**: Grid/List item for subject navigation.
- **SessionCard**: Timeline item for session tracking.

## Test Credentials

Since the application uses a mock authentication system, you can use the following credentials to test different roles:

| Role        | Email                 | Password |
| :---------- | :-------------------- | :------- |
| **Parent**  | `parent@mentora.com`  | `123456` |
| **Student** | `student@mentora.com` | `123456` |
| **Mentor**  | `mentor@mentora.com`  | `123456` |

## Installation & Running the Project

### Prerequisites

- Flutter SDK 3.38.5
- Android Studio / VS Code with Flutter extension

### Steps

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd flutter_application_task
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## Tech Stack

- **Flutter**: Cross-platform Framework.
- **Dart**: Programming Language.
- **GetX**: State management, dependency injection, and navigation.
- **Material UI**: Design system following modern aesthetics.

## Assumptions Made

- **Mock Authentication**: Login is performed against a local list of users.
- **Static Content**: Lessons, sessions, and insights are generated from mock data models.
- **No Persistence**: Data is held in memory and resets on app restart.
- **Role Detection**: Role is determined by the email pattern during mock login.

## UI/UX Considerations

- **Clean Layout**: Minimalist design with focus on readability.
- **Consistent Spacing**: Global padding and margin constants.
- **Role-Based Experience**: Tailored dashboards for each user type.
- **Interactive States**: Loading indicators and empty state placeholders.
- **Premium Aesthetics**: Use of soft shadows, gradients, and rounded corners.

## Demo Video

A 1–2 minute demo video is available demonstrating:

- The full Login flow.
- Navigation through all three role-based dashboards.
- Creating a new student profile.
- Seamless navigation from Lessons to Session Details.

🎥 Watch the demo here: 
https://drive.google.com/file/d/1xVCogcFJ4tlleqPf2O9CbudOxvr86fhC/view?usp=drive_link

## Author
**[Deepak Khamkar]**  
Email: [khamkard09@gmail.com]  
Phone: +91 77450 47843  
LinkedIn: https://www.linkedin.com/in/deepak-khamkar130903
