import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/utils/constants.dart';
import 'package:warehouse_app/widgets/index.dart';
import 'home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return HomeScreenViewModel();
      },
      onViewModelReady: (HomeScreenViewModel viewModel) {
        viewModel.init();
      },
      builder: (context, viewModel, _) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: AppColor.secondary600,
                expandedHeight: 160,
                elevation: 1,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.zero,
                  background: const Image(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  title: Container(
                    padding: const EdgeInsets.only(left: 8, top: 3, bottom: 3),
                    color: Colors.black.withOpacity(0.5),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Warehouse',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipOval(
                            child: Material(
                              color: Colors.blue, // Button color
                              child: InkWell(
                                onTap: () {},
                                child: const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Icon(
                                    FontAwesomeIcons.user,
                                    size: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                stretchTriggerOffset: 200,
                onStretchTrigger: () {
                  return Future.value();
                },
              ),
              SliverToBoxAdapter(
                child: viewModel.showTaskView(context),
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                children: viewModel.views.map((e) {
                  return SplashButtonWidget(
                    elevation: 1,
                    borderRadius: const Radius.circular(10),
                    color: e["color"],
                    innerPadding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 10),
                    onPressed: () {
                      viewModel.onSelectedView(context, e["name"]);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Icon(
                              e["icon"],
                              size: 70,
                            ),
                          ),
                        ),
                        Text(
                          viewModel.getName(
                            e["name"],
                          ),
                          style: TextStyle(fontSize: 23),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
