import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search/presentation/home/components/photo_widget.dart';
import 'package:provider/provider.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      /// 주의: initState에선 context.write x 단발성 함수이기 때문에 read 사용
      final viewModel = context.read<HomeViewModel>();
      _subscription = viewModel.eventStream.listen((event) {
        event.when(showSnackBar: (message) {
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /**
     * context.watch로 실시간으로 확인해서 view를 처음부터 다시 그리는 작업을 반복하는 것은 성능 상 좋지 x
     * Consumer 사용해서 provider를 이용하면서도 필요한 ui만 그리기
     */
    // final viewModel = Provider.of<HomeViewModel>(context); // 이전 방식
    // final viewModel = context.watch<HomeViewModel>(); // 요즘 방식?

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '이미지 검색 앱',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    context.read<HomeViewModel>().fetch(_controller.text);
                    // viewModel.fetch(_controller.text);
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Consumer<HomeViewModel>(builder: (_, viewModel, child) {
            return Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: viewModel.photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final photo = viewModel.photos[index];
                    return PhotoWidget(photo: photo);
                  }),
            );
          })
        ],
      ),
    );
  }
}
