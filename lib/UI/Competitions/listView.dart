import 'package:flutter/material.dart';
import 'cards.dart';


Widget getListView(var listItems){

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
      LikeButton(listItems[index]["fav"]),
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
    //SideCard contents
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
          Text("${listItems[index]["date"]}",style: TextStyle(fontSize:17,color: Colors.grey[900], fontWeight: FontWeight.w600)),
          Divider(color:Colors.black,thickness:2,height:7),
          Container(height:1.4,color :Colors.grey,width:56 ),
          Divider(height: 7,),
           Text("${listItems[index]["time"]}",style: TextStyle(fontSize:15,color: Colors.grey[900], fontWeight: FontWeight.w300)),

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

class LikeButton extends StatefulWidget{
  var favo;
  LikeButton(bool i){
      this.favo=i;
  }
  @override
  State<StatefulWidget> createState(){
      return _LikeButton(); 
  }
}

class _LikeButton extends State<LikeButton>{
  @override
  Widget build(BuildContext context) {
    var likeState = widget.favo;
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
                      widget.favo=!widget.favo;
                    });
                  })
                  );

        
  }
} 