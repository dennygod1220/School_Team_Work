const db = require('../util/database');

module.exports = class Post {
  constructor(sid, name, phone, email, depName) {
    this.sid = sid;
    this.name = name;
    this.phone = phone;
    this.email = email;
    this.depName = depName;
  }


  static EditStudent(id,body){
    var sql = 'UPDATE student SET name = "'+body.name+'",phone = "'+body.phone+'",email ="'+body.email+'",pid = "'+body.pid+'"  WHERE sid =' + id;
    console.log(sql);
    
    return db.execute(sql);
  }

  static Editshow(id){
    return db.execute('SELECT A.sid,A.name,A.phone,A.email,A.pid,B.depName FROM student A inner join department B where A.pid = B.depid and A.sid ='+id);
  }

  static show(id){
    return db.execute('SELECT A.sid,A.name,A.phone,A.email,B.depName FROM student A inner join department B where A.pid = B.depid and A.sid ='+id);
  }
  static showinfo(id){
    return db.execute('SELECT * FROM student A inner JOIN'+
    ' department B , class C ,grade D , credit E,Elective F'+
    ' where A.pid = B.depid and B.depid = C.pid and D.sid = A.sid and D.gid = E.gid and E.Elective_id = F.eid and A.sid ='+id);
  }


};