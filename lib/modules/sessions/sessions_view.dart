import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sessions_controller.dart';
import '../../widgets/session_card.dart';
import '../../data/models/lesson_model.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class SessionsView extends StatefulWidget {
  const SessionsView({super.key});

  @override
  State<SessionsView> createState() => _SessionsViewState();
}

class _SessionsViewState extends State<SessionsView> {
  LessonModel? lesson;
  final controller = Get.put(SessionsController());

  @override
  void initState() {
    super.initState();
    final dynamic args = Get.arguments;
    if (args is LessonModel) {
      lesson = args;
      controller.fetchSessions(lesson!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Guard: if lesson is null (e.g. hot restart), show loader and go back
    if (lesson == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (Get.currentRoute == '/sessions') {
          Get.back();
        }
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,

      /// MODERN APPBAR
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black.withOpacity(.08),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        title: Text(
          lesson?.title ?? "",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Get.back(),
        ),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return CustomScrollView(
          slivers: [
            /// HEADER CARD
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 10),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(.25),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// TOP ROW
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.18),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.play_lesson_rounded,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Text(
                                    "${controller.sessions.length} Sessions Available",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 2),

                                const Text(
                                  "Continue your learning journey",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      /// PROGRESS BAR (INTERACTIVE LOOK)
                      Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.25),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: FractionallySizedBox(
                          widthFactor: 0.45,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        "45% completed",
                        style: TextStyle(color: Colors.white70, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// SECTION TITLE
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Text(
                  "Sessions",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),

            /// SESSION LIST
            if (controller.sessions.isEmpty)
              const SliverFillRemaining(
                child: Center(child: Text(AppStrings.noSessions)),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final session = controller.sessions[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: SessionCard(
                        session: session,
                        onTap: () =>
                            Get.toNamed('/session-detail', arguments: session),
                      ),
                    );
                  }, childCount: controller.sessions.length),
                ),
              ),
          ],
        );
      }),
    );
  }
}
