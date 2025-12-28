import 'package:flutter/material.dart';
import 'package:path/path.dart' as path_package;
import 'package:sqflite/sqflite.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/* ================= APP  hhh================= */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

/* ================= DATABASE ================= */

class DBHelper {
  static Database? _db;

  static Future<Database> get db async {
    _db ??= await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final path = path_package.join(await getDatabasesPath(), 'lesson_app.db');
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE folders(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          lesson TEXT,
          name TEXT
        )
      ''');
      await db.execute('''
        CREATE TABLE links(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          folder_id INTEGER,
          title TEXT,
          url TEXT
        )
      ''');

      // Insert default data for N5 and N4 grammar revision and mock tests
      // N5 Grammar Revision
      final n5GrammarLesson = 'N5 Grammar Revision';
      final n5GrammarFolderId = await db.insert(
          'folders', {'lesson': n5GrammarLesson, 'name': 'Key Resources'});
      await db.insert('links', {
        'folder_id': n5GrammarFolderId,
        'title': 'JLPT N5 Grammar Practice Tests',
        'url':
            'https://www.japanesejlpt.com/learn-japanese/jlpt-n5-grammar-tests/'
      });
      await db.insert('links', {
        'folder_id': n5GrammarFolderId,
        'title': 'JLPT N5 Grammar List',
        'url': 'https://japanesetest4you.com/jlpt-n5-grammar-list/'
      });
      await db.insert('links', {
        'folder_id': n5GrammarFolderId,
        'title': 'JLPT N5 Grammar Lessons',
        'url': 'https://thejapanesepage.com/jlpt-n5-grammar-lessons/'
      });
      await db.insert('links', {
        'folder_id': n5GrammarFolderId,
        'title': 'JLPT N5 Study Material',
        'url': 'https://nihongoichiban.com/home/jlpt-n5-study-material/'
      });
      await db.insert('links', {
        'folder_id': n5GrammarFolderId,
        'title': 'JLPT N5 Study Guide',
        'url':
            'https://nihongo-career.com/tips/2024/08/18/study-guide-for-the-jlpt-n5-exam/'
      });
      await db.insert('links', {
        'folder_id': n5GrammarFolderId,
        'title': 'JLPT N5 Online Resources',
        'url': 'https://studyinjapan.org/jlpt-n5-online-resources/'
      });
      await db.insert('links', {
        'folder_id': n5GrammarFolderId,
        'title': 'Beginner Japanese Course - Basic Grammar',
        'url':
            'https://jplt-dialogplus.com/beginner-japanese-course-basic-grammar/'
      });

      // N5 Mock Tests
      final n5MockLesson = 'N5 Mock Tests';
      final n5MockFolderId = await db.insert(
          'folders', {'lesson': n5MockLesson, 'name': 'Practice Tests'});
      await db.insert('links', {
        'folder_id': n5MockFolderId,
        'title': 'Official JLPT Sample Questions',
        'url': 'https://www.jlpt.jp/e/samples/forlearners.html'
      });
      await db.insert('links', {
        'folder_id': n5MockFolderId,
        'title': 'Nihongo Master JLPT N5 Practice Test',
        'url': 'https://www.nihongomaster.com/jlpt-n5-practice-test'
      });
      await db.insert('links', {
        'folder_id': n5MockFolderId,
        'title': 'Japanesetest4you JLPT Tests',
        'url': 'https://japanesetest4you.com/'
      });
      await db.insert('links', {
        'folder_id': n5MockFolderId,
        'title': 'Bunpro JLPT Practice Tests',
        'url': 'https://bunpro.jp/jlpt_practice_tests'
      });
      await db.insert('links', {
        'folder_id': n5MockFolderId,
        'title': 'Testizer JLPT N5 Test',
        'url': 'https://testizer.com/tests/japanese-proficiency-test-online-5/'
      });
      await db.insert('links', {
        'folder_id': n5MockFolderId,
        'title': 'JLPT N5 Kanji Practice Tests',
        'url':
            'https://www.japanesejlpt.com/learn-japanese/jlpt-n5-kanji-tests/'
      });
      await db.insert('links', {
        'folder_id': n5MockFolderId,
        'title': 'Nihonez JLPT Tests',
        'url': 'https://nihonez.com/jlpt-test/'
      });
      await db.insert('links', {
        'folder_id': n5MockFolderId,
        'title': 'Unagibun JLPT Online Simulation',
        'url': 'https://www.unagibun.com/jlpt-online/'
      });
      await db.insert('links', {
        'folder_id': n5MockFolderId,
        'title': 'Lingoclass Free JLPT N5 Quiz',
        'url': 'https://www.lingoclass.co.uk/free-jlpt-n5-online-quiz'
      });

      // N4 Grammar Revision
      final n4GrammarLesson = 'N4 Grammar Revision';
      final n4GrammarFolderId = await db.insert(
          'folders', {'lesson': n4GrammarLesson, 'name': 'Key Resources'});
      await db.insert('links', {
        'folder_id': n4GrammarFolderId,
        'title': 'JLPT N4 Grammar Lessons',
        'url': 'https://thejapanesepage.com/jlpt-n4-grammar/'
      });
      await db.insert('links', {
        'folder_id': n4GrammarFolderId,
        'title': 'JLPT N4 Grammar Practice Tests',
        'url':
            'https://www.japanesejlpt.com/learn-japanese/jlpt-n4-grammar-tests/'
      });
      await db.insert('links', {
        'folder_id': n4GrammarFolderId,
        'title': 'JLPT N4 Grammar List',
        'url': 'https://migii.net/en/blog/jlpt-n4-grammar-list'
      });
      await db.insert('links', {
        'folder_id': n4GrammarFolderId,
        'title': '20 Must-Know Grammar Points for JLPT N4',
        'url': 'https://cotoacademy.com/20-must-know-grammar-points-jlpt-n4/'
      });
      await db.insert('links', {
        'folder_id': n4GrammarFolderId,
        'title': 'Japanesetest4you JLPT Resources',
        'url': 'https://japanesetest4you.com/'
      });
      await db.insert('links', {
        'folder_id': n4GrammarFolderId,
        'title': 'JLPT N4 Study Methods and Resources',
        'url': 'https://jtalkonline.com/jlpt-n4-study-method-and-resources/'
      });

      // N4 Mock Tests
      final n4MockLesson = 'N4 Mock Tests';
      final n4MockFolderId = await db.insert(
          'folders', {'lesson': n4MockLesson, 'name': 'Practice Tests'});
      await db.insert('links', {
        'folder_id': n4MockFolderId,
        'title': 'Official JLPT Sample Questions',
        'url': 'https://www.jlpt.jp/e/samples/forlearners.html'
      });
      await db.insert('links', {
        'folder_id': n4MockFolderId,
        'title': 'Nihongo Master JLPT N4 Practice Test',
        'url': 'https://www.nihongomaster.com/jlpt-n4-practice-test'
      });
      await db.insert('links', {
        'folder_id': n4MockFolderId,
        'title': 'Japanesetest4you JLPT Tests',
        'url': 'https://japanesetest4you.com/'
      });
      await db.insert('links', {
        'folder_id': n4MockFolderId,
        'title': 'Nihonez JLPT N4 Tests',
        'url': 'https://nihonez.com/jlpt-n4-test/'
      });
      await db.insert('links', {
        'folder_id': n4MockFolderId,
        'title': 'Testizer JLPT N4 Test',
        'url': 'https://testizer.com/tests/japanese-proficiency-test-online-4/'
      });
      await db.insert('links', {
        'folder_id': n4MockFolderId,
        'title': 'Bunpro JLPT Practice Tests',
        'url': 'https://bunpro.jp/jlpt_practice_tests'
      });
      await db.insert('links', {
        'folder_id': n4MockFolderId,
        'title': 'Japanese Quizzes JLPT Tests',
        'url': 'https://japanesequizzes.com/'
      });
      await db.insert('links', {
        'folder_id': n4MockFolderId,
        'title': 'Unagibun JLPT Online Simulation',
        'url': 'https://www.unagibun.com/jlpt-online/'
      });
    });
  }

  /* FOLDER CRUD */
  static Future<void> insertFolder(String lesson, String name) async {
    final d = await db;
    await d.insert('folders', {'lesson': lesson, 'name': name});
  }

  static Future<List<Map<String, dynamic>>> getFolders(String lesson) async {
    final d = await db;
    return d.query('folders', where: 'lesson = ?', whereArgs: [lesson]);
  }

  static Future<void> updateFolder(int id, String name) async {
    final d = await db;
    await d.update('folders', {'name': name}, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> deleteFolder(int id) async {
    final d = await db;
    await d.delete('folders', where: 'id = ?', whereArgs: [id]);
    await d.delete('links', where: 'folder_id = ?', whereArgs: [id]);
  }

  /* LINK CRUD */
  static Future<void> insertLink(int folderId, String title, String url) async {
    final d = await db;
    await d
        .insert('links', {'folder_id': folderId, 'title': title, 'url': url});
  }

  static Future<List<Map<String, dynamic>>> getLinks(int folderId) async {
    final d = await db;
    return d.query('links', where: 'folder_id = ?', whereArgs: [folderId]);
  }

  static Future<void> updateLink(int id, String title, String url) async {
    final d = await db;
    await d.update('links', {'title': title, 'url': url},
        where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> deleteLink(int id) async {
    final d = await db;
    await d.delete('links', where: 'id = ?', whereArgs: [id]);
  }
}

/* ================= HOME ================= */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final lessons = const [
    'N5 Grammar Revision',
    'N5 Mock Tests',
    'N4 Grammar Revision',
    'N4 Mock Tests',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JLPT N5 & N4')),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(lessons[i]),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FolderPage(lesson: lessons[i])),
          ),
        ),
      ),
    );
  }
}

/* ================= FOLDERS ================= */

class FolderPage extends StatefulWidget {
  final String lesson;
  const FolderPage({super.key, required this.lesson});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  List<Map<String, dynamic>> folders = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    folders = await DBHelper.getFolders(widget.lesson);
    setState(() {});
  }

  void addFolder() async {
    final ctrl = TextEditingController();
    final currentContext = context;
    await showDialog(
      context: currentContext,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Folder'),
        content: TextField(controller: ctrl),
        actions: [
          TextButton(
            onPressed: () async {
              if (ctrl.text.isNotEmpty) {
                await DBHelper.insertFolder(widget.lesson, ctrl.text);
                Navigator.pop(dialogContext);
                load();
              }
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }

  void editFolder(Map<String, dynamic> folder) async {
    final ctrl = TextEditingController(text: folder['name']);
    final currentContext = context;
    await showDialog(
      context: currentContext,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Folder'),
        content: TextField(controller: ctrl),
        actions: [
          TextButton(
            onPressed: () async {
              if (ctrl.text.isNotEmpty) {
                await DBHelper.updateFolder(folder['id'], ctrl.text);
                Navigator.pop(dialogContext);
                load();
              }
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lesson)),
      floatingActionButton: FloatingActionButton(
          onPressed: addFolder, child: const Icon(Icons.add)),
      body: ListView.builder(
        itemCount: folders.length,
        itemBuilder: (context, i) {
          final folder = folders[i];
          return Dismissible(
            key: ValueKey(folder['id']),
            background: Container(color: Colors.red),
            onDismissed: (direction) async {
              await DBHelper.deleteFolder(folder['id']);
              load();
            },
            child: ListTile(
              title: Text(folder['name']),
              trailing: PopupMenuButton(
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'edit', child: Text('Edit')),
                ],
                onSelected: (v) => editFolder(folder),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LinkPage(
                      folderId: folder['id'], folderName: folder['name']),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/* ================= LINKS ================= */

class LinkPage extends StatefulWidget {
  final int folderId;
  final String folderName;
  const LinkPage({super.key, required this.folderId, required this.folderName});

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  List<Map<String, dynamic>> links = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    links = await DBHelper.getLinks(widget.folderId);
    setState(() {});
  }

  void addLink() async {
    final t = TextEditingController();
    final u = TextEditingController();
    final currentContext = context;
    await showDialog(
      context: currentContext,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Link'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: t,
                decoration: const InputDecoration(hintText: 'Title')),
            TextField(
                controller: u,
                decoration: const InputDecoration(hintText: 'URL')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if (t.text.isNotEmpty && u.text.isNotEmpty) {
                await DBHelper.insertLink(widget.folderId, t.text, u.text);
                Navigator.pop(dialogContext);
                load();
              }
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }

  void editLink(Map<String, dynamic> link) async {
    final t = TextEditingController(text: link['title']);
    final u = TextEditingController(text: link['url']);
    final currentContext = context;
    await showDialog(
      context: currentContext,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Link'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [TextField(controller: t), TextField(controller: u)],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if (t.text.isNotEmpty && u.text.isNotEmpty) {
                await DBHelper.updateLink(link['id'], t.text, u.text);
                Navigator.pop(dialogContext);
                load();
              }
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.folderName)),
      floatingActionButton: FloatingActionButton(
          onPressed: addLink, child: const Icon(Icons.add)),
      body: ListView.builder(
        itemCount: links.length,
        itemBuilder: (context, i) {
          final link = links[i];
          return Dismissible(
            key: ValueKey(link['id']),
            background: Container(color: Colors.red),
            onDismissed: (direction) async {
              await DBHelper.deleteLink(link['id']);
              load();
            },
            child: ListTile(
              title: Text(link['title']),
              subtitle: Text(link['url']),
              trailing: PopupMenuButton(
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'edit', child: Text('Edit')),
                ],
                onSelected: (v) => editLink(link),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewPage(url: link['url'])),
              ),
            ),
          );
        },
      ),
    );
  }
}

/* ================= WEBVIEW ================= */

class WebViewPage extends StatefulWidget {
  final String url;
  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    controller = WebViewController.fromPlatformCreationParams(params)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            debugPrint('WebView error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Web View')),
      body: WebViewWidget(controller: controller),
    );
  }
}
