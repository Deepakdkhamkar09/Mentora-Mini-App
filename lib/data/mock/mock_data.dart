import '../models/lesson_model.dart';
import '../models/session_model.dart';
import '../models/student_model.dart';
import '../models/user_model.dart';

class MockData {
  // Auto-increment ID counter for new users
  static int _nextUserId = 4;

  static List<UserModel> users = [
    UserModel(id: 1, name: "John Doe",     role: "parent",  email: "parent@mentora.com",  password: "123456"),
    UserModel(id: 2, name: "Alex Smith",   role: "student", email: "student@mentora.com", password: "123456"),
    UserModel(id: 3, name: "Sarah Connor", role: "mentor",  email: "mentor@mentora.com",  password: "123456"),
  ];

  static List<StudentModel> students = [
    StudentModel(name: "Alice Smith",     email: "alice@example.com",   dob: DateTime(2010, 5, 20),  password: "123456"),
    StudentModel(name: "Bob Jones",       email: "bob@example.com",     dob: DateTime(2012, 8, 15),  password: "123456"),
    StudentModel(name: "Charlie Brown",   email: "charlie@example.com", dob: DateTime(2011, 3, 10),  password: "123456"),
    StudentModel(name: "Diana Prince",    email: "diana@example.com",   dob: DateTime(2013, 11, 25), password: "123456"),
    StudentModel(name: "Ethan Hunt",      email: "ethan@example.com",   dob: DateTime(2010, 1, 5),   password: "123456"),
    StudentModel(name: "Fiona Gallagher", email: "fiona@example.com",   dob: DateTime(2014, 6, 12),  password: "123456"),
  ];

  /// Registers a new student as a loginable user.
  static void addStudentUser(StudentModel student) {
    users.add(UserModel(
      id: _nextUserId++,
      name: student.name,
      role: "student",
      email: student.email,
      password: student.password,
    ));
  }

  static List<LessonModel> lessons = [
    LessonModel(id: 1, title: "Mathematics (Advanced)"),
    LessonModel(id: 2, title: "Physics (Quantum)"),
    LessonModel(id: 3, title: "English Literature"),
    LessonModel(id: 4, title: "World History"),
    LessonModel(id: 5, title: "Computer Science"),
    LessonModel(id: 6, title: "Creative Arts"),
  ];

  static Map<int, List<SessionModel>> sessions = {
    1: [
      SessionModel(topic: "Algebra Basics",     date: DateTime(2024, 3, 15), summary: "Introduction to variables and equations."),
      SessionModel(topic: "Linear Equations",    date: DateTime(2024, 3, 18), summary: "Solving for X and Y in multiple contexts."),
      SessionModel(topic: "Geometry Principles", date: DateTime(2024, 3, 22), summary: "Understanding shapes and angles."),
      SessionModel(topic: "Trigonometry Intro",  date: DateTime(2024, 3, 25), summary: "Sine, Cosine, and Tangent fundamentals."),
    ],
    2: [
      SessionModel(topic: "Newton's Laws",  date: DateTime(2024, 3, 16), summary: "In-depth look at mechanics and motion."),
      SessionModel(topic: "Work and Energy",date: DateTime(2024, 3, 19), summary: "Calculating kinetic and potential energy."),
      SessionModel(topic: "Optics",         date: DateTime(2024, 3, 23), summary: "Study of light, reflection, and refraction."),
      SessionModel(topic: "Thermodynamics", date: DateTime(2024, 3, 26), summary: "Heat transfer and energy conservation."),
    ],
    3: [
      SessionModel(topic: "Grammar Rules",        date: DateTime(2024, 3, 17), summary: "Common mistakes in English and syntax."),
      SessionModel(topic: "Shakespeare Analysis", date: DateTime(2024, 3, 20), summary: "Reviewing Hamlet and Macbeth themes."),
      SessionModel(topic: "Literature Review",    date: DateTime(2024, 3, 24), summary: "Analyzing classic novels from the 19th century."),
      SessionModel(topic: "Creative Writing",     date: DateTime(2024, 3, 27), summary: "Workshop on short story structure."),
    ],
    4: [
      SessionModel(topic: "French Revolution", date: DateTime(2024, 3, 14), summary: "Key events and figures of 1789."),
      SessionModel(topic: "World War I",        date: DateTime(2024, 3, 21), summary: "Origins and impact of the Great War."),
    ],
    5: [
      SessionModel(topic: "Python Basics",   date: DateTime(2024, 3, 13), summary: "Variables, loops, and basic logic."),
      SessionModel(topic: "Data Structures", date: DateTime(2024, 3, 20), summary: "Lists, dictionaries, and sets in Python."),
    ],
    6: [
      SessionModel(topic: "Color Theory",         date: DateTime(2024, 3, 12), summary: "How colors interact and influence mood."),
      SessionModel(topic: "Sketching Techniques", date: DateTime(2024, 3, 19), summary: "Basic forms and shading practice."),
    ],
  };

  /// Login by exact email + password match.
  static Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    try {
      return users.firstWhere(
        (u) =>
            u.email.toLowerCase() == email.toLowerCase().trim() &&
            u.password == password,
      );
    } catch (_) {
      return null;
    }
  }
}
