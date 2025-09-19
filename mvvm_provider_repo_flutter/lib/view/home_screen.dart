import 'package:flutter/material.dart';
import 'package:mvvm_provider_repo_flutter/data/response/status.dart';
import 'package:mvvm_provider_repo_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_provider_repo_flutter/utils/utils.dart';
import 'package:mvvm_provider_repo_flutter/view_model/home_view_model.dart';
import 'package:mvvm_provider_repo_flutter/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              userPreference.remove().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Center(child: Text("Logout")),
          ),
          SizedBox(width: 30),
        ],
      ),

      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return Center(child: Text(value.moviesList.message.toString()));
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.moviesList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          
                        },
                        child: ListTile(
                          leading: Image.network(
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                            value.moviesList.data!.movies![index].posterurl
                                .toString(),
                        
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error);
                            },
                          ),
                          title: Text(
                            value.moviesList.data!.movies![index].title
                                .toString(),
                          ),
                          subtitle: Text(
                            value.moviesList.data!.movies![index].year.toString(),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(Utils.avaregerating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),
                              Icon(Icons.star, color: Colors.amber),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              default:
            }

            return Container();
          },
        ),
      ),
    );
  }
}
