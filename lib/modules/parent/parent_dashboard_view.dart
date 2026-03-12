import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'parent_controller.dart';
import '../../widgets/student_card.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/dashboard_header.dart';

class ParentDashboardView extends StatelessWidget {
  const ParentDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ParentController>();

    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;
    final isTablet = size.width > 600 && size.width <= 900;

    final padding = isDesktop ? size.width * .15 : 20.0;

    return Scaffold(
      backgroundColor: AppColors.dashboardBackground,
      body: CustomScrollView(
        slivers: [
          /// PINNED APP BAR
          DashboardHeader(onLogout: () => Get.offAllNamed('/login')),

          /// SCROLLING WELCOME SECTION
          SliverToBoxAdapter(
            child: Obx(
              () => DashboardWelcome(
                title: controller.currentUser.value?.name ?? "Parent",
                subtitle: "Manage your students and their lessons",
              ),
            ),
          ),

          /// ACTION SECTION
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(padding, 32, padding, 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your Students",
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
                  const SizedBox(width: 16),
                  Flexible(
                    child: ElevatedButton.icon(
                      onPressed: () => Get.toNamed('/create-student'),
                      icon: const Icon(Icons.add_rounded, size: 20),
                      label: const Text("Add Student"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// STUDENTS GRID
          SliverPadding(
            padding: EdgeInsets.fromLTRB(padding, 0, padding, 40),
            sliver: Obx(() {
              if (controller.isLoading.value) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (controller.students.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: Text(AppStrings.noStudents)),
                );
              }

              return SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: isDesktop ? 450 : (isTablet ? 400 : 600),
                  mainAxisExtent: 100,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),

                delegate: SliverChildBuilderDelegate((context, index) {
                  final student = controller.students[index];

                  return StudentCard(
                    student: student,
                    onTap: () => Get.toNamed('/lessons'),
                  );
                }, childCount: controller.students.length),
              );
            }),
          ),
        ],
      ),
    );
  }
}
