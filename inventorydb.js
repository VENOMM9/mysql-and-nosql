
//create db

//use inventory;

db;
inventory
 
//create and insert into db

db.users.insert([{ _id: 1, name: "Ann", email:"anny@gmail.com", password:"Anniemarie", role_id: 1 },
    { _id: 2, name: "victor", email: "victor@gmail.com", password: "victorny", role_id: 2 }, { "name": "Johnson", email: "johnsonmay@yahoo.com", password: "Johnsonmay12", role_id: 3 }]);


 db.product.insert(
        [
          { _id: 1, name: "samat", size:10000, price:120000, category_id: 1 },
          { name:"satan_2", size:20000, price:200000, category_id: 2 },
          { name:"patriot", size:30000, price:250000, category_id: 3 }
        ]
);
     
db.orders.insert(
    [
      { _id: 1, order_no: 5678, user_id:ObjectId("64fbbe13cfbd138c4443c395"), product_id: 1 },
      {   order_no:2675, user_id:2, product_id: ObjectId("64fc426dcfbd138c4443c397")},
      {  order_no:5565, user_id:1, product_id:  ObjectId("64fc426dcfbd138c4443c398") }
    ]
);
 
db.category.insert(
    [
      { _id: 1, name: "offensive"},
      { _id: 2, name: "defensive"},
      
    ]
);
 
db.roles.insert(
    [
      { _id: 1, name: "admin"},
      { _id: 2, name: "user"  },
      
    ]
);


//get or retrieve from db
 
db.getCollectionInfos();
db.users.find();
db.users.find({ name: "Johnson"});
db.product.find({ size: 20000});


//update db

db.users.updateOne( { name: "Ann" },
{
  $set: {
  name:"ANN"},
 
});

db.category.updateOne( { name: "catastrophic" },
{
  $set: {
  name:"nuclear"},
 
    });



//delete db

db.product.deleteOne({ _id: ObjectId("64fc426dcfbd138c4443c398") });
db.products.drop();
