import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../pages/answer_function_list_page.dart';
import '../../pages/dashboard_page.dart';
import '../../pages/generate_math_problems_page.dart';
import '../../pages/main/main_page.dart';
import '../../pages/math_field_list_page.dart';
import '../../pages/math_problem_list_page.dart';
import '../../pages/math_sub_field_list_page.dart';
import '../../pages/mutate_answer_function_page.dart';
import '../../pages/mutate_math_field_page.dart';
import '../../pages/mutate_math_problem_page.dart';
import '../../pages/mutate_math_sub_field_page.dart';
import '../../pages/settings_page.dart';
import '../../pages/sign_in_page.dart';
import '../../pages/users_page.dart';
import '../../shared/abstract/factory.dart';
import 'navigator_key_holder.dart';
import 'routes.dart';

@LazySingleton(as: Factory<List<RouteBase>>)
class GoRoutesFactory implements Factory<List<RouteBase>> {
  @override
  List<RouteBase> newInstance() {
    return [
      _buildShellRoute(),
      GoRoute(
        parentNavigatorKey: NavigatorKeyHolder.rootKey,
        path: Routes.signIn,
        builder: (_, __) => const SignInPage(),
      ),
    ];
  }

  RouteBase _buildShellRoute() {
    return StatefulShellRoute.indexedStack(
      parentNavigatorKey: NavigatorKeyHolder.rootKey,
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.dashboard,
              builder: (_, __) => const DashboardPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.settings,
              builder: (_, __) => const SettingsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.users,
              builder: (_, __) => const UsersPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.mathFieldList,
              builder: (_, __) => const MathFieldListPage(),
              routes: [
                GoRoute(
                  path: Routes.mutateMathField,
                  builder: (_, state) => const MutateMathFieldPage(mathFieldId: null),
                ),
                GoRoute(
                  path: '${Routes.mutateMathField}/:mathFieldId',
                  builder: (_, state) {
                    final mathFieldId = state.pathParameters['mathFieldId'];

                    return MutateMathFieldPage(
                      mathFieldId: mathFieldId,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.mathSubFieldList,
              builder: (_, __) => const MathSubFieldListPage(),
              routes: [
                GoRoute(
                  path: Routes.mutateMathSubField,
                  builder: (_, state) => const MutateMathSubFieldPage(mathSubFieldId: null),
                ),
                GoRoute(
                  path: '${Routes.mutateMathSubField}/:mathSubFieldId',
                  builder: (_, state) {
                    final mathSubFieldId = state.pathParameters['mathSubFieldId'];

                    return MutateMathSubFieldPage(
                      mathSubFieldId: mathSubFieldId,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.mathProblemList,
              builder: (_, __) => const MathProblemListPage(),
              routes: [
                GoRoute(
                  path: '${Routes.mutateMathProblem}/:mathProblemId',
                  builder: (_, state) {
                    final mathProblemId = state.pathParameters['mathProblemId'];

                    return MutateMathProblemPage(
                      mathProblemId: mathProblemId,
                    );
                  },
                ),
                GoRoute(
                  path: Routes.mutateMathProblem,
                  builder: (_, state) => const MutateMathProblemPage(mathProblemId: null),
                ),
                GoRoute(
                  path: Routes.generateMathProblems,
                  builder: (_, state) => const GenerateMathProblemsPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.answerFunctionList,
              builder: (_, __) => const AnswerFunctionListPage(),
              routes: [
                GoRoute(
                  path: Routes.mutateAnswerFunction,
                  builder: (_, state) => const MutateAnswerFunctionPage(answerFunctionId: null),
                ),
                GoRoute(
                  path: '${Routes.mutateAnswerFunction}/:answerFunctionId',
                  builder: (_, state) {
                    final answerFunctionId = state.pathParameters['answerFunctionId'];

                    return MutateAnswerFunctionPage(
                      answerFunctionId: answerFunctionId,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
      pageBuilder: (_, GoRouterState state, StatefulNavigationShell navigationShell) {
        return MaterialPage(
          key: state.pageKey,
          child: MainPage(
            child: navigationShell,
          ),
        );
      },
    );
  }
}
