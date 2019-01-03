const db = require('../util/database');

module.exports = class Post {
  constructor(sid, name, phone, email, depName) {
    this.sid = sid;
    this.name = name;
    this.phone = phone;
    this.email = email;
    this.depName = depName;
  }



  // READ
  static fetchAll() {
    return db.execute('SELECT A.sid,A.name,A.phone,A.email,B.depName FROM student A inner join department B where A.pid = B.depid');
  }


  static addStudent(name, phone, email, pid) {
    console.log('INSERT INTO student (name, phone, email, pid) VALUES ("' + name + '","' + phone + '","' + email + '",' + pid + ')');

    return db.execute('INSERT INTO student (name, phone, email, pid) VALUES ("' + name + '","' + phone + '","' + email + '",' + pid + ')');
  }
};