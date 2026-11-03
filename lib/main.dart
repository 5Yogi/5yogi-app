
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(FiveYogiApp());

class FiveYogiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5Yogi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFFFFBF7), primaryColor: Color(0xFFC17C60)),
      home: MainNav(),
    );
  }
}

class MainNav extends StatefulWidget {
  @override
  _MainNavState createState() => _MainNavState();
}
class _MainNavState extends State<MainNav> {
  int idx = 0;
  final pages = [HomePage(), LibraryPage(), ChallengePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
        onTap: (i)=>setState(()=>idx=i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFC17C60),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.local_fire_department_rounded), label: 'Challenge'),
        ],
      ),
    );
  }
}

final List<Map<String, String>> fbVideos = [
  {
    "id": "d1",
    "title": "Day 1: Masseter & Jaw Release",
    "url": "https://www.facebook.com/reel/994202513540952/",
    "desc": "7-Day Intensive Face Lift Challenge Day 1 - 5 mins",
    "earn": ""
  },
  {
    "id": "d2",
    "title": "Day 2: Forehead Anti-Aging Massage",
    "url": "https://www.facebook.com/reel/1639761850472399/",
    "desc": "Botox? No Thanks! Part 2 - 4 exercises x10",
    "earn": ""
  },
  {
    "id": "d3",
    "title": "Day 3: Cheek Lift - Snatched Cheeks",
    "url": "https://www.facebook.com/reel/2153148162084721/",
    "desc": "Sun Smile, Puffer Fish, Cheek Lifter",
    "earn": ""
  },
  {
    "id": "d4",
    "title": "Day 4: Smile Lines Eraser",
    "url": "https://www.facebook.com/reel/2809588832722419/",
    "desc": "Silent enemy adds 5 years - 3 exercises",
    "earn": ""
  },
  {
    "id": "d5",
    "title": "Day 5: Lymphatic & Surface Lift - STAR",
    "url": "https://www.facebook.com/reel/3140761092784474/",
    "desc": "Your top performer - Reduce 50% puffiness",
    "earn": "\$18.22 Top Earner"
  },
  {
    "id": "d6",
    "title": "Day 6: Eye Inner Corners Drain",
    "url": "https://www.facebook.com/reel/3054142068120058/",
    "desc": "Reverse sunken eyes in 5 mins",
    "earn": ""
  },
  {
    "id": "d7",
    "title": "Day 7: Forever Young Secret",
    "url": "https://www.facebook.com/reel/1017522267843655/",
    "desc": "3 exercises x10 times - Final integration",
    "earn": ""
  },
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final starVideo = fbVideos[4];
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("Good Morning,\nBeautiful ✨", style: TextStyle(fontSize:32, fontWeight:FontWeight.bold, height:1.1)),
          SizedBox(height:8),
          Text("130K community • 7 videos from Facebook", style: TextStyle(color: Colors.grey)),
          SizedBox(height:20),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow:[BoxShadow(color:Colors.black12, blurRadius:8)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children:[Icon(Icons.star, color: Colors.amber), SizedBox(width:6), Text("STAR VIDEO - Day 5", style:TextStyle(fontWeight:FontWeight.bold, color:Color(0xFFC17C60)))]),
                SizedBox(height:8),
                Text(starVideo["title"]!, style: TextStyle(fontSize:20, fontWeight:FontWeight.bold)),
                Text(starVideo["earn"]!, style: TextStyle(color: Colors.deepOrange, fontWeight:FontWeight.bold, fontSize:12)),
                SizedBox(height:12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60), minimumSize: Size(double.infinity,48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> VideoPlayerPage(video: starVideo))),
                  child: Text("Play STAR Video - Direct FB", style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
          SizedBox(height:20),
          Text("How it works:", style: TextStyle(fontWeight:FontWeight.bold)),
          SizedBox(height:8),
          Text("• Tap any video below to play directly from your Facebook Page\n• No need to re-upload to YouTube\n• Videos play inside app via Facebook embed", style: TextStyle(fontSize:13, color: Colors.grey)),
        ],
      ),
    );
  }
}

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20), child: Align(alignment: Alignment.centerLeft, child: Text("Library - 7 Facebook Videos", style: TextStyle(fontSize:24, fontWeight:FontWeight.bold)))),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal:20),
              itemCount: fbVideos.length,
              itemBuilder: (ctx,i){
                final v = fbVideos[i];
                final isStar = v["id"]=="d5";
                return Container(
                  margin: EdgeInsets.only(bottom:12),
                  decoration: BoxDecoration(color: isStar ? Color(0xFFFFF3E0) : Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: isStar ? Colors.amber : Colors.transparent), boxShadow:[BoxShadow(color:Colors.black12, blurRadius:4)]),
                  child: ListTile(
                    leading: Container(width:48,height:48, decoration: BoxDecoration(color: isStar ? Colors.amber : Color(0xFFC17C60), borderRadius: BorderRadius.circular(8)), child: Icon(Icons.play_circle_filled, color: Colors.white)),
                    title: Text(v["title"]!, style: TextStyle(fontWeight:FontWeight.bold, fontSize:14)),
                    subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
                      Text(v["desc"]!, style: TextStyle(fontSize:12, color: Colors.grey)),
                      if(isStar) Text(v["earn"]!, style: TextStyle(fontSize:11, color: Colors.deepOrange, fontWeight:FontWeight.bold))
                    ]),
                    trailing: Icon(Icons.arrow_forward_ios, size:16),
                    onTap: ()=> Navigator.push(ctx, MaterialPageRoute(builder: (_)=> VideoPlayerPage(video: v))),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return SafeArea(child: ListView(padding: EdgeInsets.all(20), children:[
      Text("7-Day Face Lift\nReset", style: TextStyle(fontSize:32, fontWeight:FontWeight.bold, height:1.1)),
      Text("Direct from Facebook Page 5Yogi - No YouTube needed", style: TextStyle(color: Colors.grey, fontSize:12)),
      SizedBox(height:20),
      ...fbVideos.map((v){
        final dayNum = fbVideos.indexOf(v)+1;
        final isStar = v["id"]=="d5";
        return Container(
          margin: EdgeInsets.only(bottom:12),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: isStar ? Color(0xFFFFF3E0) : Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: isStar ? Colors.amber : Colors.transparent)),
          child: Row(children:[
            Container(width:36,height:36, decoration: BoxDecoration(color: isStar ? Colors.amber : Color(0xFFC17C60), shape: BoxShape.circle), child: Center(child: Text("D$dayNum", style:TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize:12)))),
            SizedBox(width:12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
              if(isStar) Text("⭐ STAR - \$18.22 Top Earner", style: TextStyle(fontSize:10, fontWeight:FontWeight.bold, color: Colors.deepOrange)),
              Text(v["title"]!, style: TextStyle(fontWeight:FontWeight.bold, fontSize:14)),
              Text("Tap to play Facebook video", style: TextStyle(fontSize:12, color: Colors.grey))
            ])),
            IconButton(icon: Icon(Icons.play_circle_fill, color: Color(0xFFC17C60)), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> VideoPlayerPage(video: v))))
          ]),
        );
      }).toList()
    ]));
  }
}

class VideoPlayerPage extends StatefulWidget {
  final Map<String,String> video;
  VideoPlayerPage({required this.video});
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late final WebViewController _controller;
  @override
  void initState(){
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.video["url"]!));
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(widget.video["title"]!, style: TextStyle(fontSize:16)), backgroundColor: Color(0xFFFFFBF7), elevation:0),
      body: Column(
        children: [
          AspectRatio(aspectRatio: 9/16, child: WebViewWidget(controller: _controller)),
          Expanded(child: ListView(padding: EdgeInsets.all(16), children:[
            Text(widget.video["title"]!, style: TextStyle(fontSize:20, fontWeight:FontWeight.bold)),
            SizedBox(height:8),
            if(widget.video["earn"]!.isNotEmpty) Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: Colors.amber.shade100, borderRadius: BorderRadius.circular(6)), child: Text(widget.video["earn"]!, style: TextStyle(fontWeight:FontWeight.bold, color: Colors.deepOrange))),
            SizedBox(height:8),
            Text(widget.video["desc"]!),
            SizedBox(height:12),
            Text("Source: ${widget.video["url"]!}", style: TextStyle(fontSize:11, color: Colors.grey)),
            SizedBox(height:12),
            Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFFF5EFE6), borderRadius: BorderRadius.circular(8)), child: Text("💡 Tip: Video chạy trực tiếp từ Facebook Page 5Yogi của bạn. Người dùng bấm Play sẽ xem ngay trong app, không cần thoát ra Facebook.", style: TextStyle(fontSize:12))),
          ]))
        ],
      ),
    );
  }
}
