const moment = require('moment');

const Post = require('../models/post');
const Category = require('../models/category');
const User = require('../models/user');
const Student = require('../models/student');
const StudentInfo = require('../models/studentinfo');


exports.editsendstudent = async (req,res,next)=>{
  console.log(req.body);
  console.log(req.query);
  await StudentInfo.EditStudent(req.query.sid,req.body)
  .then(([rows])=>{
   
  })
  res.redirect('/moreinfo?id='+req.query.sid);
  
}

exports.editstudent = async (req,res,next)=>{
  var data;
  await StudentInfo.Editshow(req.query.id)
  .then(([rows])=>{
    data = rows;
  })
  res.render('edit/student',{
    data:data
  })
}

exports.moreinfo = async (req, res, next) =>{
  console.log(req.query.id);
  var data1;
  var data2;
  try{
    
    await StudentInfo.show(req.query.id)
    .then(([rows])=>{
      data1 = rows;
    })
    await StudentInfo.showinfo(req.query.id)
    .then(([rows])=>{
      console.log(rows);
      data2 = rows;
    })

    res.render('studentInfo',{
      data:data1,
      data2:data2
    })
  }catch(e){
    console.log('dashboard controller moreinfo function has an error!!!!');
    console.log(e);
  }
}

exports.getDashboard = async (req, res, next) => {
  try{
    await Student.fetchAll()
    .then(([rows]) =>{
      res.render('student',{
        data:rows
      });
    })
  }catch(e){
    console.log('dashboard controller getDashboard function has an error!!!!');
    console.log(e);
  }
};

exports.addstudent = async (req,res,next) =>{
  console.log(req.body);
  await Student.addStudent(req.body.name,req.body.phone,req.body.email,req.body.pid)
  .then(([rows])=>{
    // console.log(rows);
    
  })
  res.redirect('/');
}