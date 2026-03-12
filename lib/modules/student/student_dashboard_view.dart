import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';
import '../lessons/lessons_controller.dart';
import '../../widgets/lesson_card.dart';
import '../../widgets/dashboard_header.dart';

class StudentDashboardView extends StatelessWidget {
  const StudentDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LessonsController());

    final size = MediaQuery.of(context).size;
    final width = size.width;

    final isDesktop = width > 900;
    final isTablet = width > 600 && width <= 900;

    final horizontalPadding = isDesktop ? width * .15 : 20.0;

    return Scaffold(
      backgroundColor: AppColors.dashboardBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          /// PINNED APP BAR
          DashboardHeader(onLogout: () => Get.offAllNamed('/login')),

          /// SCROLLING WELCOME SECTION
          SliverToBoxAdapter(
            child: Obx(
              () => DashboardWelcome(
                title: controller.currentUser.value?.name ?? "Student",
                subtitle: "Continue learning and explore new lessons",
              ),
            ),
          ),

          /// ---------- DASHBOARD STATS CARD ----------
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                20,
                horizontalPadding,
                10,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                      color: AppColors.black.withOpacity(.06),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    /// ICON
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.menu_book_rounded,
                        color: AppColors.primary,
                        size: 28,
                      ),
                    ),

                    const SizedBox(width: 16),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Learning",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "Explore lessons and continue sessions",
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// ---------- LESSON TITLE ----------
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                16,
                horizontalPadding,
                10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Available Lessons",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// ---------- LESSON GRID ----------
          Obx(() {
            if (controller.isLoading.value) {
              return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (controller.lessons.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: Text("No lessons available")),
              );
            }

            return SliverPadding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                0,
                horizontalPadding,
                40,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final lesson = controller.lessons[index];

                  return LessonCard(
                    lesson: lesson,
                    onTap: () => Get.toNamed('/sessions', arguments: lesson),
                  );
                }, childCount: controller.lessons.length),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: isDesktop
                      ? 320
                      : isTablet
                      ? 260
                      : 220,
                  mainAxisExtent: 170,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
