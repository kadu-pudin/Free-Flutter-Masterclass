class Student {
  final String name;
  final int? score;

  Student({required this.name, this.score});
}

void main() {
  List<Student> students = [
    Student(name: 'Carlos', score: 8),
    Student(name: 'Enzo'),
    Student(name: 'Camila', score: 6),
    Student(name: 'Gustavo'),
    Student(name: 'André', score: 10),
  ];
  print('ALUNOS QUE FIZERAM O EXAME');
  for (var student in students) {
    student.score != null
        ? print(student.name + ' ' + student.score.toString())
        : null;
  }
  print('ALUNOS QUE NÃO FIZERAM O EXAME');
  for (var student in students) {
    student.score ?? print(student.name);
  }
}
