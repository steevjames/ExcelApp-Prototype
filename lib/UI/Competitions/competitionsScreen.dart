
import "package:flutter/material.dart";



String selection="All";
double cardHeight=95;
double imgCardWidth =275;
double sideCardWidth=75;
var theme=Color.fromRGBO(15,10,70,1);

var compets = [
  {
    "name":"RoboSoccer",
    "time":"11:00am",
    "date":"13 Nov",
    "fav":false,
    "image":"https://previews.123rf.com/images/alexeitm/alexeitm1806/alexeitm180600002/103288124-classic-football-soccer-ball-on-green-grass-ground-in-front-of-white-goal-with-net.jpg"
  },
  {
    "name":"Algorithms",
    "time":"11:00am",
    "date":"12 Nov",
    "fav":false,
    "image":"https://image.shutterstock.com/image-vector/isometric-young-men-standing-near-260nw-1416555089.jpg"
  },
  {
    "name":"Reverse Coding",
    "time":"11:00am",
    "date":"11 Nov",
    "fav":false,
    "image":"https://images.unsplash.com/photo-1515879218367-8466d910aaa4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9"
  },
  {
    "name":"Kryptos",
    "time":"3:00am",
    "date":"13 Nov",
    "fav":false,
    "image":"https://blog.hightail.com/wp-content/uploads/2014/12/HIT_Encrypt_Cryptex.png"
  },
];

var tech = [
  {
    "name":"RoboSoccer",
    "time":"11:00am",
    "date":"13 Nov",
    "fav":false,
    "image":"https://previews.123rf.com/images/alexeitm/alexeitm1806/alexeitm180600002/103288124-classic-football-soccer-ball-on-green-grass-ground-in-front-of-white-goal-with-net.jpg"
  },
  {
    "name":"Algorithms",
    "time":"11:00am",
    "date":"12 Nov",
    "fav":false,
    "image":"https://image.shutterstock.com/image-vector/isometric-young-men-standing-near-260nw-1416555089.jpg"
  },
  {
    "name":"Reverse Coding",
    "time":"11:00am",
    "date":"11 Nov",
    "fav":false,
    "image":"https://images.unsplash.com/photo-1515879218367-8466d910aaa4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9"
  },
];

var non = [
  {
    "name":"Kryptos",
    "time":"3:00am",
    "date":"13 Nov",
    "fav":false,
    "image":"https://blog.hightail.com/wp-content/uploads/2014/12/HIT_Encrypt_Cryptex.png"
  },
];

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Excel",
      home: 
      Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.0),
          child:
          Container( alignment: Alignment.center, height: 110,
            child:          
            AppBar(title:
                  Row(children: <Widget>[
                      Text("Event List", style: TextStyle( color: theme, fontSize: 30, fontWeight: FontWeight.bold)),
                      Expanded(child: SizedBox()),
                      IconButton(icon:Icon(Icons.search),color:theme ,onPressed:() {/*...*/})
                  ],)
                  , backgroundColor: Colors.white
          )
          )
        ),  
        body: Category()
        )
      
    );
  }

}

cardImage(String url) {
    var gradientcolor1 = theme;// Color(0xe61f1a59);
  var gradientcolor2 = theme;
  // var gradientcolor1 = Color(0xe61f1a59);
  // var gradientcolor2 = Color(0x801f1a59);
  var roundness = BorderRadius.circular(16);
  return Stack(children: <Widget>[    
    Opacity(opacity: 1,
    child: Container(width:imgCardWidth,height: cardHeight,decoration: new BoxDecoration(
        image: new DecorationImage(fit: BoxFit.cover,
        image: new NetworkImage(url),
      ),
      borderRadius: new BorderRadius.all(const  Radius.circular(20.0),)
    ))),
    //gradient overlay
    Opacity(opacity: 0.78,
    child:
    Container(
      width: imgCardWidth,height:cardHeight,
      decoration: BoxDecoration(
          borderRadius: roundness,
          gradient: LinearGradient(
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            colors: [gradientcolor1, gradientcolor2],
            stops: [0.0, 1.0],
          )),
    )
  )
  ]);
}

sideCard() {
  var gradientcolor1 = Colors.grey;
  var gradientcolor2 = gradientcolor1;
  var roundness = BorderRadius.circular(16);
  return Stack(children: <Widget>[    
    Opacity(
      opacity: 0.19,
      child: 
    Container(
      width: sideCardWidth,height:cardHeight,
      decoration: BoxDecoration(
          borderRadius: roundness,
          gradient: LinearGradient(
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            colors: [gradientcolor1, gradientcolor2],
            stops: [0.0, 1.0],
          )),
    ))
  ]);
}


class LikeButton extends StatefulWidget{
  int index;
  LikeButton(int i){
      this.index=i;
  }
  @override
  State<StatefulWidget> createState(){
      return _LikeButton(); 
  }
}

class _LikeButton extends State<LikeButton>{
  @override
  Widget build(BuildContext context) {
    var likeState;
    if(selection=="All"){
      likeState=compets[widget.index]["fav"];
    }
    else if(selection=="Tech"){
      likeState=tech[widget.index]["fav"];
    }
    else{
      likeState=non[widget.index]["fav"];
    }
    return  Container(
              alignment: AlignmentDirectional.topCenter,
              height: 50, width: 50,
              decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(30),
                  //border: Border.all(color: Colors.white, width: 2)
                  ),
              child: 
                  IconButton(
                  iconSize: 25,
                  color: Colors.white,
                  icon: !likeState
                      ? Icon(Icons.favorite_border)
                      : Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    //Insert function that enables this event as favourite
                    /*
                        Over Here
                    */
                    setState(() {
                      if(selection=="All")
                        compets[widget.index]["fav"] = !compets[widget.index]["fav"];
                      else if(selection=="Tech")
                        tech[widget.index]["fav"] = !tech[widget.index]["fav"];
                      else if(selection=="Non-Tech")
                        non[widget.index]["fav"] = !non[widget.index]["fav"];
                    });
                  })
                  );

        
  }
} 


class Category extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Category();
  }
}

//This Stateful widget returns everything and since it uses the global lists above, it cannot be moved to another file

class _Category extends State<Category>{
  @override 
  Widget build(BuildContext context){ 
                  if(selection=="All"){
                  return  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  SizedBox(
                    height: 30,
                    child: 
                  FlatButton(
                  padding: EdgeInsets.all(2),color: theme,
                  highlightColor: theme,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: ()
                {
                  setState((){
                      selection="All";
                      });
                },
                child: Text("All",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: Colors.white)),
                )
                  )
                ,
                SizedBox(width:10),
                SizedBox(
                    height: 30,
                    child: 
                OutlineButton(
                  padding: EdgeInsets.all(2),
                  borderSide: BorderSide(color:theme,width: 1),
                  highlightColor: theme,highlightedBorderColor: theme,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: ()
                {setState((){
                      selection="Tech";
                      });},
                child: Text("Tech",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: theme)),
                )
                )
                ,
                SizedBox(width:10),
                SizedBox(
                    height: 30,
                    child: 
                OutlineButton(
                  padding: EdgeInsets.all(2),
                  borderSide: BorderSide(color:theme,width: 1),
                  highlightColor: theme,highlightedBorderColor: theme,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: ()
                {setState((){
                      selection="Non-Tech";
                      });},
                child: Text("Non-Tech",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: theme)),
                ))
                ]
                ),
                SizedBox(height: 10),
                Expanded(child: getListView())
                ]);
                  }
                  else if(selection=="Tech"){
                  return Column(
                    children: <Widget>[ 
                    SizedBox(height:20), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ 
                      SizedBox(
                    height: 30,
                    child: 
                  OutlineButton(
                  padding: EdgeInsets.all(2),
                  borderSide: BorderSide(color:theme,width: 1),
                  highlightColor: theme,highlightedBorderColor: theme,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: ()
                {setState((){
                      selection="All";
                      });},
                child: Text("All",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: theme)),
                )),
                SizedBox(width:10),
                SizedBox(
                    height: 30,
                    child: 
                  FlatButton(
                  padding: EdgeInsets.all(2),color: theme,
                  highlightColor: theme,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: ()
                {
                  setState((){
                      selection="Tech";
                      });
                },
                child: Text("Tech",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: Colors.white)),
                )),
                SizedBox(width:10),
                SizedBox(
                    height: 30,
                    child: 
                OutlineButton(
                  padding: EdgeInsets.all(2),
                  borderSide: BorderSide(color:theme,width: 1),
                  highlightColor: theme,highlightedBorderColor: theme,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: ()
                {setState((){
                      selection="Non-Tech";
                      });},
                child: Text("Non-Tech",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: theme)),
                ))
                ]
                ),
                SizedBox(height: 10),
                Expanded(child: getListView())
                ]);
                  }
                else{
                  return  Column(
                    children: <Widget>[
                    SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ 
                      SizedBox(
                    height: 30,
                    child: 
                  OutlineButton(
                  padding: EdgeInsets.all(2),
                  borderSide: BorderSide(color:theme,width: 1),
                  highlightColor: theme,highlightedBorderColor: theme,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: ()
                {setState((){
                      selection="All";
                      });},
                child: Text("All",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: theme)),
                )),
                SizedBox(width:10),
                SizedBox(
                    height: 30,
                    child: 
                OutlineButton(
                  padding: EdgeInsets.all(2),
                  borderSide: BorderSide(color:theme,width: 1),
                  highlightColor: theme,highlightedBorderColor: theme,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: ()
                {setState((){
                      selection="Tech";
                      });},
                child: Text("Tech",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: theme)),
                )),
                SizedBox(width:10),
                SizedBox(
                    height: 30,
                    child: 
                  FlatButton(
                  padding: EdgeInsets.all(2),color: theme,
                  highlightColor: theme,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: ()
                {
                  setState((){
                      selection="Non-Tech";
                      });
                },
                child: Text("Non-Tech",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: Colors.white)),
                ))
                ]
                ),
                SizedBox(height: 10),
                Expanded(child: getListView())
                ]);
                  }

  }
}


Widget getListView(){
 var listItems ;
 if(selection=="All")
  listItems=compets;
  else if(selection=="Tech")
  listItems=tech;
  else 
  listItems=non;
  var listview = ListView.builder(
    
    itemCount: listItems.length,
    itemBuilder: (context,index) {
      return 
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Expanded(child: 
      Card(
        elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.only(top:12,bottom:12,right:20,left: 20),
      child:
        Stack(
          alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            
          ),
       cardImage(listItems[index]["image"]),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:<Widget>[
    PreferredSize(
      preferredSize:Size.fromWidth(imgCardWidth),
      child:
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
    
      Expanded(child: FlatButton(onPressed: (){/*....*/}, 
    child:
        Container(
          width:150,
          child:
    Text(listItems[index]["name"],style: TextStyle(fontSize:22,color: Colors.white, fontWeight: FontWeight.w700),))
      ),
      ),
      LikeButton(index),
      SizedBox(width: 10),      
    ]
    )
    )
    ]
    )

    
        ]
    )
    )
    ),
    Container(
      child:
      //Stack for the side card with time and date
        Stack( 
      alignment: AlignmentDirectional.center,
      children: <Widget>[
    sideCard(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
          Text("${listItems[index]["date"]}",style: TextStyle(fontSize:17,color: Colors.black, fontWeight: FontWeight.w600)),
          Divider(color:Colors.black,thickness:2,height:5),
           Text("${listItems[index]["time"]}",style: TextStyle(fontSize:17,color: Colors.black, fontWeight: FontWeight.w300)),

    ])
    ])
    ),
    SizedBox(width:20)
    ]
      
    );
    }
  );
  return listview;

}
