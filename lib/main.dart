
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _index = 0;
  final screens = [HomeScreen(), LibraryScreen(), ChallengeScreen(), ProgressScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i)=>setState(()=>_index=i),
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

// DATA - Top videos from user's actual earnings
final exercises = [
  {"id":"d1e1","name":"Forehead Smoother - Press & Glide","cat":"forehead","duration":"5 min","videoId":"jNQXAC9IVRw","reps":"x10","desc":"Press gently above eyebrows, glide outward to temples. Exhale while gliding."},
  {"id":"d1e2","name":"Zigzag Smoother","cat":"forehead","duration":"3 min","videoId":"jNQXAC9IVRw","reps":"x10","desc":"Small zigzag from eyebrows to hairline, 3 lines center left right."},
  {"id":"d2e1","name":"Under-Eye Drain (Star \$7.25)","cat":"eyes","duration":"4 min","videoId":"jNQXAC9IVRw","reps":"x10","desc":"Ring fingers only, inner corner to outer to temple to ear. Don't pull."},
  {"id":"d2e2","name":"Eye Opener","cat":"eyes","duration":"3 min","videoId":"jNQXAC9IVRw","reps":"x10","desc":"V shape index under brow middle on cheek, look up squint lower lid."},
  {"id":"d5e1","name":"Lymphatic Drain - STAR \$18.22","cat":"jaw","duration":"5 min","videoId":"jNQXAC9IVRw","reps":"x10","desc":"Fingers behind ears glide down side neck to collarbone. Main highway for fluid."},
  {"id":"d5e2","name":"Jawline Scoop","cat":"jaw","duration":"4 min","videoId":"jNQXAC9IVRw","reps":"x10","desc":"Scoop with index+middle under chin glide along jawline to ear then down."},
  {"id":"d3e1","name":"Cheek Balloon","cat":"cheeks","duration":"3 min","videoId":"jNQXAC9IVRw","reps":"x10","desc":"Inflate cheeks move air left right circles inside release sigh."},
  {"id":"d4e1","name":"Smile Lines - Tongue Press","cat":"smile","duration":"4 min","videoId":"jNQXAC9IVRw","reps":"x10","desc":"Tongue inside cheek press smile line from inside fingers outside hold 3s."},
];

final challengeDays = [
  {"day":1,"title":"Forehead Smoother - Erase Stress Lines","isStar":false,"ex":["d1e1","d1e2"]},
  {"day":2,"title":"Eye Rejuvenation - Open & Brighten","isStar":false,"ex":["d2e1","d2e2"]},
  {"day":3,"title":"Cheek Lift - Apple of Youth","isStar":false,"ex":["d3e1"]},
  {"day":4,"title":"Smile Lines Softener","isStar":false,"ex":["d4e1"]},
  {"day":5,"title":"Lymphatic & Sculpt - STAR VIDEO","isStar":true,"ex":["d5e1","d5e2"]},
  {"day":6,"title":"Jawline & Neck Lift","isStar":false,"ex":["d5e2"]},
  {"day":7,"title":"Full Face Glow - Integration","isStar":false,"ex":["d1e1","d2e1","d5e1"]},
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height:10),
          Text("Good Morning,\nBeautiful ✨", style: GoogleFonts.cormorantGaramond(fontSize:32, fontWeight:FontWeight.bold, color:Color(0xFF2B2B2B))),
          SizedBox(height:8),
          Text("Streak: 7 days • 130K community", style: TextStyle(color: Colors.grey)),
          SizedBox(height:24),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow:[BoxShadow(color:Colors.black12, blurRadius:8)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children:[Icon(Icons.star_rounded,color:Colors.amber), SizedBox(width:6), Text("STAR VIDEO - Day 5", style:TextStyle(fontWeight:FontWeight.bold, color:Color(0xFFC17C60)))]),
                SizedBox(height:8),
                Text("Lymphatic & Sculpt - Reduce 50% puffiness", style: GoogleFonts.cormorantGaramond(fontSize:20, fontWeight:FontWeight.bold)),
                Text("This video earned \$18.22 - Your top performer", style:TextStyle(color:Colors.grey, fontSize:12)),
                SizedBox(height:12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), minimumSize: Size(double.infinity,48)),
                  onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> ChallengeScreen())),
                  child: Text("Start 5-Min Flow", style:TextStyle(color:Colors.white)),
                )
              ],
            ),
          ),
          SizedBox(height:24),
          Text("Quick Actions", style:TextStyle(fontWeight:FontWeight.bold, fontSize:18)),
          SizedBox(height:12),
          Row(
            children: [
              _quickCard("Morning\nDepuff", Icons.water_drop_outlined),
              SizedBox(width:12),
              _quickCard("Eye\nBrighten", Icons.remove_red_eye_outlined),
              SizedBox(width:12),
              _quickCard("Jaw\nSculpt", Icons.face_retouching_natural),
            ],
          )
        ],
      ),
    );
  }
  Widget _quickCard(String t, IconData ic){
    return Expanded(child: Container(padding:EdgeInsets.all(16), decoration:BoxDecoration(color:Color(0xFFF5EFE6), borderRadius:BorderRadius.circular(12)), child: Column(children:[Icon(ic,color:Color(0xFFC17C60)), SizedBox(height:8), Text(t, textAlign:TextAlign.center, style:TextStyle(fontSize:12, fontWeight:FontWeight.w600))],),),);
  }
}

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}
class _LibraryScreenState extends State<LibraryScreen> {
  String filter = "All";
  @override
  Widget build(BuildContext context) {
    final filtered = filter=="All" ? exercises : exercises.where((e)=>e["cat"]==filter.toLowerCase()).toList();
    return SafeArea(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[Text("Library", style: GoogleFonts.cormorantGaramond(fontSize:28, fontWeight:FontWeight.bold)), Icon(Icons.search_rounded)])),
          SingleChildScrollView(scrollDirection: Axis.horizontal, padding: EdgeInsets.symmetric(horizontal:20), child: Row(children: ["All","Forehead","Eyes","Cheeks","Smile","Jaw"].map((c)=> Padding(padding: EdgeInsets.only(right:8), child: ChoiceChip(label: Text(c), selected: filter==c, onSelected: (_)=>setState(()=>filter=c), selectedColor: Color(0xFFC17C60), labelStyle: TextStyle(color: filter==c?Colors.white:Colors.black)),),).toList())),
          Expanded(child: GridView.builder(padding: EdgeInsets.all(20), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2, childAspectRatio:0.85, crossAxisSpacing:12, mainAxisSpacing:12), itemCount: filtered.length, itemBuilder: (ctx,i){
            final ex = filtered[i];
            return GestureDetector(
              onTap: ()=> Navigator.push(ctx, MaterialPageRoute(builder: (_)=> ExerciseDetail(ex: ex))),
              child: Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow:[BoxShadow(color:Colors.black12, blurRadius:4)]), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
                Expanded(child: Container(decoration: BoxDecoration(color: Color(0xFFF5EFE6), borderRadius: BorderRadius.vertical(top: Radius.circular(12))), child: Center(child: Icon(Icons.play_circle_filled_rounded, size:48, color: Color(0xFFC17C60))))),
                Padding(padding: EdgeInsets.all(10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(ex["name"] as String, maxLines:2, overflow: TextOverflow.ellipsis, style:TextStyle(fontWeight:FontWeight.bold, fontSize:13)), SizedBox(height:4), Text("${ex["reps"]} • ${ex["duration"]}", style:TextStyle(fontSize:11, color:Colors.grey))],),)
              ],),),
            );
          }))
        ],
      ),
    );
  }
}

class ExerciseDetail extends StatefulWidget {
  final Map ex;
  ExerciseDetail({required this.ex});
  @override
  _ExerciseDetailState createState() => _ExerciseDetailState();
}
class _ExerciseDetailState extends State<ExerciseDetail> {
  late YoutubePlayerController _controller;
  @override
  void initState(){
    super.initState();
    _controller = YoutubePlayerController(initialVideoId: widget.ex["videoId"], flags: YoutubePlayerFlags(autoPlay:false, mute:false));
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(widget.ex["name"]), backgroundColor: Color(0xFFFFFBF7), elevation:0, foregroundColor: Colors.black),
      body: ListView(padding: EdgeInsets.all(20), children:[
        YoutubePlayer(controller: _controller, showVideoProgressIndicator:true),
        SizedBox(height:16),
        Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Color(0xFFF5EFE6), borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          Text("How to do:", style:TextStyle(fontWeight:FontWeight.bold)),
          SizedBox(height:8),
          Text(widget.ex["desc"] as String),
          SizedBox(height:12),
          Row(children:[Icon(Icons.repeat_rounded,size:16), SizedBox(width:6), Text(widget.ex["reps"] as String, style:TextStyle(fontWeight:FontWeight.bold))])
        ],)),
        SizedBox(height:16),
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.pink.shade50, borderRadius: BorderRadius.circular(8)), child: Text("⚠️ Common Mistakes: Pressing too hard, holding breath, dragging skin down. Use 20% pressure only.", style:TextStyle(fontSize:12))),
        SizedBox(height:24),
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60), minimumSize: Size(double.infinity,48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          final done = prefs.getStringList("done") ?? [];
          done.add(widget.ex["id"] as String);
          await prefs.setStringList("done", done);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Marked as done!")));
        }, child: Text("Mark as Done ✓", style:TextStyle(color:Colors.white))),
      ]),
    );
  }
}

class ChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return SafeArea(child: ListView(padding: EdgeInsets.all(20), children:[
      Text("7-Day Face Lift\nReset", style: GoogleFonts.cormorantGaramond(fontSize:32, fontWeight:FontWeight.bold)),
      SizedBox(height:8),
      Text("No Botox, Just 5 Mins A Day - Complete all 7 days to see Day1 vs Day8", style:TextStyle(color:Colors.grey)),
      SizedBox(height:20),
      ...challengeDays.map((day){
        return Container(
          margin: EdgeInsets.only(bottom:12),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: day["isStar"] as bool ? Color(0xFFFFF3E0) : Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: day["isStar"] as bool ? Colors.amber : Colors.transparent), boxShadow:[BoxShadow(color:Colors.black12, blurRadius:4)]),
          child: Row(
            children: [
              Container(width:36,height:36, decoration: BoxDecoration(color: day["isStar"] as bool ? Colors.amber : Color(0xFFC17C60), shape: BoxShape.circle), child: Center(child: Text("D${day["day"]}", style:TextStyle(color:Colors.white, fontWeight:FontWeight.bold)))),
              SizedBox(width:12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
                if(day["isStar"] as bool) Text("⭐ STAR - \$18.22 Top Earner", style:TextStyle(fontSize:10, fontWeight:FontWeight.bold, color:Colors.deepOrange)),
                Text(day["title"] as String, style:TextStyle(fontWeight:FontWeight.bold)),
                Text("${(day["ex"] as List).length} exercises • 5 min", style:TextStyle(fontSize:12, color:Colors.grey))
              ])),
              Icon(Icons.check_circle_outline_rounded, color: Colors.grey)
            ],
          ),
        );
      }).toList(),
      SizedBox(height:20),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60), minimumSize: Size(double.infinity,52), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: (){}, child: Text("Start Today's Flow", style:TextStyle(color:Colors.white, fontSize:16)))
    ]));
  }
}

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}
class _ProgressScreenState extends State<ProgressScreen> {
  List<File> photos = [];
  final picker = ImagePicker();
  Future<void> takePhoto() async {
    final XFile? img = await picker.pickImage(source: ImageSource.camera);
    if(img!=null) setState(()=> photos.add(File(img.path)));
  }
  @override
  Widget build(BuildContext context){
    return SafeArea(child: ListView(padding: EdgeInsets.all(20), children:[
      Text("Your Progress", style: GoogleFonts.cormorantGaramond(fontSize:28, fontWeight:FontWeight.bold)),
      SizedBox(height:12),
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Color(0xFFF5EFE6), borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text("3-Angle Photo Tracker", style:TextStyle(fontWeight:FontWeight.bold)),
        SizedBox(height:8),
        Text("Take photos Day1 & Day8 same light, same white top. Photos stay on your device only (privacy safe for Play Store).", style:TextStyle(fontSize:12, color:Colors.grey)),
        SizedBox(height:12),
        Row(children:[
          _photoBox("FRONT"),
          SizedBox(width:8),
          _photoBox("45° SIDE"),
          SizedBox(width:8),
          _photoBox("SMILE"),
        ]),
        SizedBox(height:12),
        ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60)), onPressed: takePhoto, icon: Icon(Icons.camera_alt_rounded, color:Colors.white), label: Text("Take Photo", style:TextStyle(color:Colors.white))),
        if(photos.isNotEmpty) SizedBox(height:12),
        if(photos.isNotEmpty) Wrap(spacing:8, runSpacing:8, children: photos.map((f)=> ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.file(f, width:80, height:80, fit: BoxFit.cover))).toList())
      ])),
      SizedBox(height:20),
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow:[BoxShadow(color:Colors.black12, blurRadius:4)]), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text("Disclaimer", style:TextStyle(fontWeight:FontWeight.bold)),
        SizedBox(height:6),
        Text("For wellness & educational purposes only. Not medical advice. Stop if pain. Consult doctor if you have skin conditions or recent surgery.", style:TextStyle(fontSize:11, color:Colors.grey))
      ]))
    ]));
  }
  Widget _photoBox(String label){
    return Expanded(child: Container(height:80, decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid), borderRadius: BorderRadius.circular(8)), child: Center(child: Text(label, style:TextStyle(fontSize:10, fontWeight:FontWeight.bold, color:Colors.grey)))) ,);
  }
}
