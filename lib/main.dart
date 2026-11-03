import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() => runApp(FiveYogiApp());
class FiveYogiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '5Yogi', debugShowCheckedModeBanner: false, theme: ThemeData(scaffoldBackgroundColor: Color(0xFFFFFBF7), primaryColor: Color(0xFFC17C60)), home: MainNav());
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
    return Scaffold(body: pages[idx], bottomNavigationBar: BottomNavigationBar(currentIndex: idx, onTap: (i)=>setState(()=>idx=i), type: BottomNavigationBarType.fixed, selectedItemColor: Color(0xFFC17C60), items: [BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'), BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: 'Library'), BottomNavigationBarItem(icon: Icon(Icons.local_fire_department_rounded), label: 'Challenge'), BottomNavigationBarItem(icon: Icon(Icons.show_chart_rounded), label: 'Progress')]));
  }
}
final videos = [
  {"id":"d1","title":"Forehead Smoother","subtitle":"Release tension lines","cat":"UPPER FACE","duration":"2 min","reps":"x10","url":"https://www.facebook.com/reel/994202513540952/","steps":"Press above eyebrows, glide to temples x10"},
  {"id":"d2","title":"Under-Eye Drain","subtitle":"Depuff & brighten","cat":"EYE AREA","duration":"3 min","reps":"x10","url":"https://www.facebook.com/reel/3054142068120058/","steps":"Ring fingers inner to outer to temple"},
  {"id":"d5","title":"Lymphatic Drain","subtitle":"STAR • Top Performer","cat":"SCULPT","duration":"5 min","reps":"x10","url":"https://www.facebook.com/reel/3140761092784474/","steps":"Fingers behind ears glide down to collarbone x10 - Most loved"},
  {"id":"d3","title":"Jawline Scoop","subtitle":"Define & lift","cat":"LOWER FACE","duration":"4 min","reps":"x10","url":"https://www.facebook.com/reel/1639761850472399/","steps":"Pinch under chin scoop to ear"},
  {"id":"d4","title":"Cheek Balloon","subtitle":"Lift & plump","cat":"MID FACE","duration":"3 min","reps":"x10","url":"https://www.facebook.com/reel/2153148162084721/","steps":"Inflate cheeks move air left right"},
  {"id":"d6","title":"Smile Lines","subtitle":"Soften folds","cat":"MID FACE","duration":"3 min","reps":"x10","url":"https://www.facebook.com/reel/2809588832722419/","steps":"Tongue inside cheek press line"},
  {"id":"d7","title":"Forever Young Secret","subtitle":"Full face reset","cat":"RITUAL","duration":"6 min","reps":"x10","url":"https://www.facebook.com/reel/1017522267843655/","steps":"Combine all techniques 10 reps each"},
];
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final star = videos[2];
    return SafeArea(child: ListView(padding: EdgeInsets.all(20), children: [Text("Good Morning,\nBeautiful ✨", style: TextStyle(fontSize:32, fontWeight:FontWeight.bold, height:1.1)), SizedBox(height:8), Text("7-Day Reset • 130K community", style: TextStyle(color: Colors.grey)), SizedBox(height:20), Container(padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow:[BoxShadow(color:Colors.black12, blurRadius:10)]), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)), child: Row(mainAxisSize: MainAxisSize.min, children:[Icon(Icons.star, size:14, color: Colors.amber), SizedBox(width:4), Text("STAR • Top Performer", style:TextStyle(fontSize:12, fontWeight:FontWeight.bold, color: Colors.white))])), SizedBox(height:10), Text(star["title"]!, style: TextStyle(fontSize:22, fontWeight:FontWeight.bold)), Text("Most loved by community", style: TextStyle(fontSize:12, color: Colors.grey)), SizedBox(height:12), ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60), minimumSize: Size(double.infinity,48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> VideoPage(video: star))), child: Text("Start 5-Min Flow ▶", style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold))))]))]));
  }
}
class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [Padding(padding: EdgeInsets.all(20), child: Align(alignment: Alignment.centerLeft, child: Text("Library - 7 Exercises", style: TextStyle(fontSize:24, fontWeight:FontWeight.bold)))), Expanded(child: GridView.builder(padding: EdgeInsets.symmetric(horizontal:16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2, childAspectRatio:0.82, crossAxisSpacing:12, mainAxisSpacing:12), itemCount: videos.length, itemBuilder: (ctx,i){final v=videos[i];final isStar=v["id"]=="d5";return GestureDetector(onTap: ()=> Navigator.push(ctx, MaterialPageRoute(builder: (_)=> VideoPage(video: v))), child: Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: isStar ? Colors.amber : Colors.grey.shade200, width: isStar ? 1.5 : 1)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[Container(width:36,height:36, decoration: BoxDecoration(color: Color(0xFFFFF8E1), shape: BoxShape.circle), child: Center(child: Text("✨"))), Container(width:32,height:32, decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle), child: Icon(Icons.play_arrow_rounded, color: Colors.white, size:20))]), SizedBox(height:12), if(isStar) Container(margin: EdgeInsets.only(bottom:6), padding: EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)), child: Text("STAR", style:TextStyle(fontSize:10, fontWeight:FontWeight.bold, color: Colors.white))) else SizedBox(height:4), Text(v["cat"]!, style: TextStyle(fontSize:10, fontWeight:FontWeight.bold, color: Colors.grey)), Text(v["title"]!, style: TextStyle(fontWeight:FontWeight.bold, fontSize:15)), Text(v["subtitle"]!, style: TextStyle(fontSize:12, color: Colors.grey)), Spacer(), Row(children:[Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)), child: Text(v["duration"]!, style:TextStyle(fontSize:11))), SizedBox(width:6), Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)), child: Text(v["reps"]!, style:TextStyle(fontSize:11)))])])));}))]));
  }
}
class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){return SafeArea(child: ListView(padding: EdgeInsets.all(20), children:[Text("7-Day Face Lift\nReset", style: TextStyle(fontSize:32, fontWeight:FontWeight.bold, height:1.1)), Text("Direct from 【entity-Facebook¦canonical_name=Facebook】 • 5 mins a day", style: TextStyle(color: Colors.grey)), SizedBox(height:20), ...videos.asMap().entries.map((e){final idx=e.key;final v=e.value;final isStar=v["id"]=="d5";return Container(margin: EdgeInsets.only(bottom:12), padding: EdgeInsets.all(16), decoration: BoxDecoration(color: isStar ? Color(0xFFFFF3E0) : Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: isStar ? Colors.amber : Colors.grey.shade200)), child: Row(children:[Container(width:40,height:40, decoration: BoxDecoration(color: isStar ? Colors.amber : Color(0xFFC17C60), shape: BoxShape.circle), child: Center(child: Text("D${idx+1}", style:TextStyle(color: isStar ? Colors.black : Colors.white, fontWeight:FontWeight.bold)))), SizedBox(width:12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[if(isStar) Text("⭐ TOP PERFORMER", style: TextStyle(fontSize:10, fontWeight:FontWeight.bold, color: Colors.deepOrange)), Text(v["title"]!, style: TextStyle(fontWeight:FontWeight.bold)), Text("${v["duration"]} • ${v["subtitle"]}", style: TextStyle(fontSize:12, color: Colors.grey))])), IconButton(icon: Icon(Icons.play_circle_fill, color: Color(0xFFC17C60), size:32), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> VideoPage(video: v))))]));}).toList(), SizedBox(height:20), ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60), minimumSize: Size(double.infinity,52)), onPressed: (){}, child: Text("Start Today's Flow", style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold)))]));}
}
class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){return SafeArea(child: ListView(padding: EdgeInsets.all(20), children:[Text("Your Progress", style: TextStyle(fontSize:28, fontWeight:FontWeight.bold)), SizedBox(height:12), Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Color(0xFFF5EFE6), borderRadius: BorderRadius.circular(16)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text("3-Angle Photo Tracker", style: TextStyle(fontWeight:FontWeight.bold)), Text("Photos stay on your device only. Privacy safe for Play Store.", style: TextStyle(fontSize:12, color: Colors.grey)), SizedBox(height:12), Row(children:[Expanded(child: Container(height:70, decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)), child: Center(child: Text("FRONT", style:TextStyle(fontSize:11))))), SizedBox(width:8), Expanded(child: Container(height:70, decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)), child: Center(child: Text("45°", style:TextStyle(fontSize:11))))), SizedBox(width:8), Expanded(child: Container(height:70, decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)), child: Center(child: Text("SMILE", style:TextStyle(fontSize:11)))))])])), SizedBox(height:20), Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text("Disclaimer", style: TextStyle(fontWeight:FontWeight.bold)), Text("For wellness & educational purposes only. Not medical advice.", style: TextStyle(fontSize:11, color: Colors.grey))]))]));}
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
  void initState(){super.initState();_controller=WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(Uri.parse(widget.video["url"]!));}
  @override
  Widget build(BuildContext context){return Scaffold(appBar: AppBar(title: Text(widget.video["title"]!, style: TextStyle(fontSize:16))), body: Column(children: [AspectRatio(aspectRatio: 9/16, child: WebViewWidget(controller: _controller)), Expanded(child: ListView(padding: EdgeInsets.all(20), children:[Text(widget.video["title"]!, style: TextStyle(fontSize:22, fontWeight:FontWeight.bold)), Text("${widget.video["cat"]} • ${widget.video["duration"]} • ${widget.video["reps"]}", style: TextStyle(color: Colors.grey)), SizedBox(height:16), Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Color(0xFFF5EFE6), borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text("How to do:", style: TextStyle(fontWeight:FontWeight.bold)), Text(widget.video["steps"]!)])), SizedBox(height:20), ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60), minimumSize: Size(double.infinity,48)), onPressed: (){ ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Marked as done!"))); }, child: Text("Mark as Done ✓", style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold)))]))])) ;}
}
