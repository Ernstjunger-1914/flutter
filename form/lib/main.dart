import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ProperForm(),
    );
  }
}

enum SearchType { web, image, news, shopping, game }

class ProperForm extends StatefulWidget {
  const ProperForm({super.key});

  @override
  State<ProperForm> createState() => _ProperFormState();
}

class _ProperFormState extends State<ProperForm> {
  // form에서 가져온 데이터를 저장할 map
  final Map<String, dynamic> _searchForm = <String, dynamic>{
    'searchTerm': '',
    'searchType': SearchType.web,
    'safeSearchOn': true
  };

  // form을 가리키는 flutter key
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Form(
      // 제출 후, 유효성 검사 수행
      key: _key,
      child: Container(
        child: ListView(
          children: <Widget>[
            TextFormField(
              initialValue: _searchForm['searchTerm'],
              decoration: const InputDecoration(
                labelText: 'Search terms',
              ),
              onChanged: (String value) {
                setState(() => _searchForm['searchTerm'] = value);
              },
              onSaved: (String? value) {},
              // return하는 문자열은 유효성 검사에 성공하면 null, 실패하면 에러 메세지
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "검색어를 입력하시오.";
                }
                return null;
              },
            ),
            FormField<SearchType>(
              builder: (FormFieldState<SearchType> state) {
                return DropdownButton<SearchType>(
                  value: _searchForm['searchType'],
                  items: const <DropdownMenuItem<SearchType>>[
                    DropdownMenuItem<SearchType>(
                      value: SearchType.web,
                      child: Text("Web"),
                    ),
                    DropdownMenuItem<SearchType>(
                      value: SearchType.image,
                      child: Text("Image"),
                    ),
                    DropdownMenuItem<SearchType>(
                      value: SearchType.news,
                      child: Text("News"),
                    ),
                    DropdownMenuItem<SearchType>(
                      value: SearchType.shopping,
                      child: Text("Shopping"),
                    ),
                    DropdownMenuItem<SearchType>(
                      value: SearchType.game,
                      child: Text("Game"),
                    ),
                  ],
                  onChanged: (SearchType? value) {
                    setState(() => _searchForm['searchType'] = value);
                  },
                );
              },
              onSaved: (SearchType? initValue) {},
            ),
            // checkbox를 formfield로 감싸면 onsaved와 validator 사용 가능
            FormField<bool>(
              builder: (FormFieldState<bool> state) {
                return Row(
                  children: <Widget>[
                    Checkbox(
                        value: _searchForm['safeSearchOn'],
                        // checkbox의 상태가 바뀌면 원하는 작업 가능
                        onChanged: (bool? value) {
                          setState(() => _searchForm['safeSearchOn'] = value);
                        }),
                    const Text("SafeSearch ON"),
                  ],
                );
              },
              onSaved: (bool? initValue) {},
            ),
            // 제출 버튼
            ElevatedButton(
                onPressed: () {
                  // 모든 field가 유효성 검사를 통과했는지 확인
                  if (_key.currentState!.validate()) {
                    // 모든 field의 onSaved 메소드 호출
                    _key.currentState?.save();

                    print("성공적으로 저장했습니다.");
                  }
                },
                child: const Text("제출")),
          ],
        ),
      ),
    ));
  }
}
