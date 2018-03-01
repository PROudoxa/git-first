
var playground = true


class Student {
    
    var teacher2: Teacher?
    
    deinit {
        print("GoodBye student")
    }
}

class Teacher {
    
    var student2: Student?

    deinit {
        print("Goodbye teacher")
    }
}

var teacher: Teacher?



if playground {

    var student = Student()
    teacher = Teacher()





    print("exit playground")
}


print("end")
