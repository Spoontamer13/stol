

class Student {
  int id;
  String name;
  double grade;
  Student(this.id, this.name, this.grade);
}

class StudentList {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  Student getStudentWithHighestGrade() {
    students.sort((a, b) => a.grade.compareTo(b.grade));
    return students.last;
  }

  Student getStudentWithLowestGrade() {
    students.sort((a, b) => a.grade.compareTo(b.grade));
    return students.first;
  }

  double getAverageGrade() {
    double sum = 0;
    students.forEach((student) {
      sum += student.grade;
    });
    return sum / students.length;
  }

  void removeStudent(int id) {
    students.removeWhere((student) => student.id == id);
  }

  void updateStudent(int id, String name, double grade) {
    students.forEach((student) {
      if (student.id == id) {
        student.name = name;
        student.grade = grade;
      }
    });
  }

  List<Student> filterStudentsByGrade(double minGrade) {
    return students.where((student) => student.grade >= minGrade).toList();
  }

  void printAllStudents() {
    students.forEach((student) {
      print("ID: ${student.id}, Name: ${student.name}, Grade: ${student.grade}");
    });
  }
}

void main() {
  StudentList studentList = StudentList();
  

  // Создание и добавление 20 студентов в список
  for (int i = 1; i <= 20; i++) {
    studentList.addStudent(Student(i, "Student ${i}", i * 0.5));
  }


  //int a = int.parse(stdin.readLineSync()!);
  
  // Вывод всех студентов

 studentList.printAllStudents();
 

  // Вывод студента с наивысшим средним баллом
 
  Student studentWithHighestGrade = studentList.getStudentWithHighestGrade();
  print("Student with highest grade: ${studentWithHighestGrade.name}, Grade: ${studentWithHighestGrade.grade}");
 

  // Вывод студента с наименьшим средним баллом
 
  Student studentWithLowestGrade = studentList.getStudentWithLowestGrade();
  print("Student with lowest grade: ${studentWithLowestGrade.name}, Grade: ${studentWithLowestGrade.grade}");
 
  // Вывод среднего балла всех студентов
 
  double averageGrade = studentList.getAverageGrade();
  print("Average grade: $averageGrade");
 
  // Удаление студента по id
 
  studentList.removeStudent(10);
 

  // Изменение данных студента
 
  studentList.updateStudent(5, "Modified Student", 4.5);
 

  // Вывод отфильтрованных данных
 
  List<Student> filteredStudents = studentList.filterStudentsByGrade(3.0);
  print("Filtered students:");
  studentList.printAllStudents();
}

