
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(FiveYogiApp());

class FiveYogiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5Yogi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFBF7),
        primaryColor: Color(0xFFC17C60),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFFFFFBF7), elevation: 0, foregroundColor: Colors.black),
      ),
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
  final pages = [HomePage(), LibraryPage(), ChallengePage(), ProgressPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
        onTap: (i)=>setState(()=>idx=i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFC17C60),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.local_fire_department_rounded), label: 'Challenge'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart_rounded), label: 'Progress'),
        ],
      ),
    );
  }
}

// 7 VIDEOS - DIRECT FROM YOUR FACEBOOK PAGE 5YOGI - NO EARNINGS DISPLAY
final List<Map<String, String>> videos = [
  {
    "id": "d1",
    "title": "Forehead Smoother",
    "subtitle": "Release tension lines",
    "cat": "UPPER FACE",
    "duration": "2 min",
    "reps": "x10",
    "url": "https://www.facebook.com/reel/994202513540952/",
    "icon": "🧘",
    "color": "0xFFFFF8E1",
    "steps": "1. Place index fingers above eyebrows\n2. Glide outward to temples\n3. Repeat x10 times\n4. Use 20% pressure only, breathe"
  },
  {
    "id": "d2",
    "title": "Under-Eye Drain",
    "subtitle": "Depuff & brighten",
    "cat": "EYE AREA",
    "duration": "3 min",
    "reps": "x10",
    "url": "https://www.facebook.com/reel/3054142068120058/",
    "icon": "👁️",
    "color": "0xFFF3E5F5",
    "steps": "1. Ring fingers on inner corners\n2. Glide to outer corners\n3. Continue to temples\n4. Down to behind ears"
  },
  {
    "id": "d5",
    "title": "Lymphatic Drain",
    "subtitle": "STAR • Top Performer",
    "cat": "SCULPT",
    "duration": "5 min",
    "reps": "x10",
    "url": "https://www.facebook.com/reel/3140761092784474/",
    "icon": "✨",
    "color": "0xFFFFF3E0",
    "steps": "1. Fingers behind ears\n2. Glide down side neck\n3. To collarbone\n4. Repeat x10, breathe deeply\n5. This is your most loved routine"
  },
  {
    "id": "d3",
    "title": "Jawline Scoop",
    "subtitle": "Define & lift",
    "cat": "LOWER FACE",
    "duration": "4 min",
    "reps": "x10",
    "url": "https://www.facebook.com/reel/1639761850472399/",
    "icon": "💎",
    "color": "0xFFE8EAF6",
    "steps": "1. Pinch under chin\n2. Scoop along jawline to ear\n3. Glide down neck\n4. Repeat other side"
  },
  {
    "id": "d4",
    "title": "Cheek Balloon",
    "subtitle": "Lift & plump",
    "cat": "MID FACE",
    "duration": "3 min",
    "reps": "x10",
    "url": "https://www.facebook.com/reel/2153148162084721/",
    "icon": "🎈",
    "color": "0xFFFCE4EC",
    "steps": "1. Inflate cheeks with air\n2. Move air left-right\n3. Make circles inside\n4. Release with sigh"
  },
  {
    "id": "d6",
    "title": "Smile Lines",
    "subtitle": "Soften folds",
    "cat": "MID FACE",
    "duration": "3 min",
    "reps": "x10",
    "url": "https://www.facebook.com/reel/2809588832722419/",
    "icon": "😊",
    "color": "0xFFE0F2F1",
    "steps": "1. Tongue inside cheek\n2. Press smile line from inside\n3. Fingers outside support\n4. Hold 3 seconds"
  },
  {
    "id": "d7",
    "title": "Forever Young Secret",
    "subtitle": "Full face reset",
    "cat": "RITUAL",
    "duration": "6 min",
    "reps": "x10",
    "url": "https://www.facebook.com/reel/1017522267843655/",
    "icon": "🌸",
    "color": "0xFFFFF8E1",
    "steps": "1. Combine all techniques\n2. Forehead to cheeks to jaw\n3. 10 reps each\n4. Finish with deep breaths"
  },
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final star = videos[2];
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("Good Morning,\nBeautiful ✨", style: TextStyle(fontSize:32, fontWeight:FontWeight.bold, height:1.1)),
          SizedBox(height:8),
          Text("7-Day Reset • 130K community", style: TextStyle(color: Colors.grey, fontSize:13)),
          SizedBox(height:20),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow:[BoxShadow(color:Colors.black12, blurRadius:10)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children:[
                  Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(20)), child: Row(children:[Icon(Icons.star, size:14, color: Colors.black), SizedBox(width:4), Text("STAR", style:TextStyle(fontSize:12, fontWeight:FontWeight.bold))]))
                ]),
                SizedBox(height:10),
                Text(star["title"]!, style: TextStyle(fontSize:22, fontWeight:FontWeight.bold)),
                Text("Top Performer • Most loved by community", style: TextStyle(fontSize:12, color: Colors.grey)),
                SizedBox(height:12),
                ClipRRect(borderRadius: BorderRadius.circular(12), child: Container(height:160, color: Color(0xFFFFF3E0), child: Center(child: Icon(Icons.play_circle_filled, size:60, color: Color(0xFFC17C60))))),
                SizedBox(height:12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60), minimumSize: Size(double.infinity,48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> VideoPage(video: star))),
                  child: Text("Start 5-Min Flow ▶", style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold)),
                )
              ],
            ),
          ),
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
          Padding(padding: EdgeInsets.all(20), child: Align(alignment: Alignment.centerLeft, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
            Text("Library", style: TextStyle(fontSize:28, fontWeight:FontWeight.bold)),
            Text("7 exercises from your Facebook Page", style: TextStyle(color: Colors.grey, fontSize:12))
          ]))),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal:16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2, childAspectRatio:0.82, crossAxisSpacing:12, mainAxisSpacing:12),
              itemCount: videos.length,
              itemBuilder: (ctx,i){
                final v = videos[i];
                final isStar = v["id"]=="d5";
                return GestureDetector(
                  onTap: ()=> Navigator.push(ctx, MaterialPageRoute(builder: (_)=> VideoPage(video: v))),
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: isStar ? Colors.amber : Colors.grey.shade200, width: isStar ? 1.5 : 1),
                      boxShadow:[BoxShadow(color:Colors.black.withOpacity(0.04), blurRadius:8)]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[
                          Container(width:36,height:36, decoration: BoxDecoration(color: Color(int.parse(v["color"]!)), shape: BoxShape.circle), child: Center(child: Text(v["icon"]!, style:TextStyle(fontSize:18)))),
                          Container(width:32,height:32, decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle), child: Icon(Icons.play_arrow_rounded, color: Colors.white, size:20))
                        ]),
                        SizedBox(height:12),
                        if(isStar) Container(margin: EdgeInsets.only(bottom:6), padding: EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)), child: Row(mainAxisSize: MainAxisSize.min, children:[Icon(Icons.star, size:12, color: Colors.amber), SizedBox(width:4), Text("STAR", style:TextStyle(fontSize:10, fontWeight:FontWeight.bold, color: Colors.white))])) else SizedBox(height:4),
                        Text(v["cat"]!, style: TextStyle(fontSize:10, fontWeight:FontWeight.bold, color: Colors.grey, letterSpacing:1)),
                        SizedBox(height:4),
                        Text(v["title"]!, style: TextStyle(fontWeight:FontWeight.bold, fontSize:15, height:1.2)),
                        Text(v["subtitle"]!, style: TextStyle(fontSize:12, color: Colors.grey)),
                        Spacer(),
                        Row(children:[
                          Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)), child: Row(children:[Icon(Icons.timer_outlined, size:12), SizedBox(width:4), Text(v["duration"]!, style:TextStyle(fontSize:11))])),
                          SizedBox(width:6),
                          Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)), child: Text(v["reps"]!, style:TextStyle(fontSize:11))),
                        ])
                      ],
                    ),
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
      Text("Direct from Facebook • 5 mins a day", style: TextStyle(color: Colors.grey)),
      SizedBox(height:20),
      ...videos.asMap().entries.map((entry){
        final idx = entry.key;
        final v = entry.value;
        final isStar = v["id"]=="d5";
        return Container(
          margin: EdgeInsets.only(bottom:12),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: isStar ? Color(0xFFFFF3E0) : Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: isStar ? Colors.amber : Colors.grey.shade200)),
          child: Row(children:[
            Container(width:40,height:40, decoration: BoxDecoration(color: isStar ? Colors.amber : Color(0xFFC17C60), shape: BoxShape.circle), child: Center(child: Text("D${idx+1}", style:TextStyle(color: isStar ? Colors.black : Colors.white, fontWeight:FontWeight.bold, fontSize:12)))),
            SizedBox(width:12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
              if(isStar) Text("⭐ TOP PERFORMER", style: TextStyle(fontSize:10, fontWeight:FontWeight.bold, color: Colors.deepOrange)),
              Text(v["title"]!, style: TextStyle(fontWeight:FontWeight.bold, fontSize:14)),
              Text("${v["duration"]} • ${v["subtitle"]}", style: TextStyle(fontSize:12, color: Colors.grey))
            ])),
            IconButton(icon: Icon(Icons.play_circle_fill, color: Color(0xFFC17C60), size:32), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> VideoPage(video: v))))
          ]),
        );
      }).toList(),
      SizedBox(height:20),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60), minimumSize: Size(double.infinity,52), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: (){}, child: Text("Start Today's Flow", style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold)))
    ]));
  }
}

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return SafeArea(child: ListView(padding: EdgeInsets.all(20), children:[
      Text("Your Progress", style: TextStyle(fontSize:28, fontWeight:FontWeight.bold)),
      SizedBox(height:12),
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Color(0xFFF5EFE6), borderRadius: BorderRadius.circular(16)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text("3-Angle Photo Tracker", style: TextStyle(fontWeight:FontWeight.bold)),
        SizedBox(height:8),
        Text("Photos stay on your device only. No upload to server - Privacy safe for Play Store approval.", style: TextStyle(fontSize:12, color: Colors.grey)),
        SizedBox(height:12),
        Row(children:[
          _photoBox("FRONT"),
          SizedBox(width:8),
          _photoBox("45°"),
          SizedBox(width:8),
          _photoBox("SMILE"),
        ])
      ])),
      SizedBox(height:20),
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text("Disclaimer", style: TextStyle(fontWeight:FontWeight.bold)),
        SizedBox(height:6),
        Text("For wellness & educational purposes only. Not medical advice. Stop if pain. Consult doctor if you have skin conditions.", style: TextStyle(fontSize:11, color: Colors.grey))
      ]))
    ]));
  }
  Widget _photoBox(String label){
    return Expanded(child: Container(height:70, decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)), child: Center(child: Text(label, style:TextStyle(fontSize:11, fontWeight:FontWeight.bold, color: Colors.grey)))) );
  }
}

class VideoPage extends StatefulWidget {
  final Map<String,String> video;
  VideoPage({required this.video});
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
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
      appBar: AppBar(title: Text(widget.video["title"]!, style: TextStyle(fontSize:16))),
      body: Column(
        children: [
          AspectRatio(aspectRatio: 9/16, child: WebViewWidget(controller: _controller)),
          Expanded(child: ListView(padding: EdgeInsets.all(20), children:[
            Text(widget.video["title"]!, style: TextStyle(fontSize:22, fontWeight:FontWeight.bold)),
            SizedBox(height:4),
            Text("${widget.video["cat"]} • ${widget.video["duration"]} • ${widget.video["reps"]}", style: TextStyle(color: Colors.grey, fontSize:13)),
            SizedBox(height:16),
            Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Color(0xFFF5EFE6), borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
              Text("How to do:", style: TextStyle(fontWeight:FontWeight.bold)),
              SizedBox(height:8),
              Text(widget.video["steps"]!.replaceAll("\\n", "\n")),
            ])),
            SizedBox(height:16),
            Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.pink.shade50, borderRadius: BorderRadius.circular(8)), child: Text("⚠️ Tips: Use 20% pressure only, breathe deeply, don't drag skin down. Photos stay on device.", style: TextStyle(fontSize:12))),
            SizedBox(height:20),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60), minimumSize: Size(double.infinity,48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: (){ ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Marked as done! Keep going!"))); }, child: Text("Mark as Done ✓", style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold)))
          ]))
        ],
      ),
    );
  }
}
