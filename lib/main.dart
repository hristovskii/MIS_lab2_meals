import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lab2_meals/screens/home_screen.dart';
import 'package:lab2_meals/screens/meals_screen.dart';
import 'package:lab2_meals/screens/recipe_detail_screen.dart';
import 'package:lab2_meals/screens/random_recipe_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hearth - Recipe Explorer',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/meals/:category',
            name: 'meals',
            builder: (context, state) {
              final category = state.pathParameters['category']!;
              return MealsScreen(categoryName: category);
            },
          ),
          GoRoute(
            path: '/recipe/:id',
            name: 'recipe',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return RecipeDetailScreen(mealId: id);
            },
          ),
          GoRoute(
            path: '/random',
            name: 'random',
            builder: (context, state) => const RandomRecipeScreen(),
          ),
        ],
      ),
    );
  }
}
