void main() {
  List<Course> courses = [
    Course(name: "Informatique", notes: [15, 18, 20, 20, 16, 0]),
    Course(name: "Français", notes: [5, 8, 0, 0, 16, 10]),
  ];

  var average = getTotalAverage(courses);
  print("La moyenne totale est de ${average.toStringAsFixed(2)}");
}

class Course {
  String name = "";
  List<double> notes = [];

  Course({required this.name, required this.notes});

  double? getAverage(){
    if(notes.isEmpty){
         return null;
    }
    double total = 0.0;
    total = notes.reduce((note1, note2) => note1 + note2);
    double average = total / notes.length;
    print("La moyenne en ${this.name} est de ${average.toStringAsFixed(2)}");
    return total / notes.length;
  }
}

// getAverageCourse(List<Course> courses){
//   for(var course in courses){
//     double total = 0;
//     int count = 0;
//     for(var note in course.notes){
//       total += note;
//       count ++;
//     }
//     double average = total/count;
//     print("La moyenne en ${course.name} est de ${average.toStringAsFixed(2)}");
//   }
// }

getTotalAverage(List<Course> courses) {
  double total = 0;

  for (var course in courses) {
    total+= course.getAverage()!;
  }

  double average = total / courses.length;

  return average;
}
