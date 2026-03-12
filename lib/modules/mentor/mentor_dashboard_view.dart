import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../parent/parent_controller.dart';
import '../../widgets/student_card.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/dashboard_header.dart';

class MentorDashboardView extends StatelessWidget {
  const MentorDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ParentController());

    final size = MediaQuery.of(context).size;
    final width = size.width;

    final isDesktop = width > 900;
    final padding = isDesktop ? width * .15 : 20.0;

    return Scaffold(
      backgroundColor: AppColors.dashboardBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          /// PINNED APP BAR
          DashboardHeader(
            onLogout: () => Get.offAllNamed('/login'),
          ),

          /// SCROLLING WELCOME SECTION
          SliverToBoxAdapter(
            child: Obx(
              () => DashboardWelcome(
                title: controller.currentUser.value?.name ?? "Mentor",
                subtitle: "Manage your students and lessons",
              ),
            ),
          ),

          /// ---------------- SECTION TITLE ----------------
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(padding, 32, padding, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Students",
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

          /// ---------------- STUDENT LIST ----------------
          Obx(() {
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

            return SliverPadding(
              padding: EdgeInsets.fromLTRB(padding, 0, padding, 40),

              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final student = controller.students[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: StudentCard(
                      student: student,
                      onTap: () => Get.toNamed('/lessons'),
                    ),
                  );
                }, childCount: controller.students.length),
              ),
            );
          }),
        ],
      ),
    );
  }
}
