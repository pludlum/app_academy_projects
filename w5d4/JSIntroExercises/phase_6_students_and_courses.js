const Student = function(fname, lname) {
  this.fname = fname;
  this.lname = lname;
  this.courses = [];
};


Student.prototype.name = function () {
  return [this.fname, this.lname].join(' ');
};

Student.prototype.enroll = function (course) {
  if (this.courses.includes(course)) {
    return;
  } else {
    this.courses.push(course);
    course.students.push(this);
  }
};

Student.prototype.courseLoad = function () {
  let courseLoad = {};

  for (var i = 0; i < this.courses.length; i++) {
    let dept = this.courses[i].department;
    let cred = this.courses[i].credits;

    if (courseLoad[dept] === undefined) {
      courseLoad[dept] = cred;
    } else {
      courseLoad[dept] += cred;
    }
  }
  return courseLoad;
};


const Course = function(name, department, credits) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students = [];
};

Course.prototype.addStudent = function(student) {
  student.enroll(this);
};
