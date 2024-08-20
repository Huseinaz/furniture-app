import 'package:flutter/material.dart';
import 'package:furniture/components/account_option.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'My Profile',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/profile.jpg'),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 29, 97, 124),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.photo_camera_outlined,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Michael Leanon",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 1),
                        const Text(
                          "michaellean42@gmail.com",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Container(
                    color: const Color.fromARGB(255, 248, 248, 248),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Text(
                            'Account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        AccountOption(
                          icon: Icons.settings_outlined,
                          label: 'Settings',
                          iconColor: Colors.black,
                          iconBackgroundColor:
                              const Color.fromARGB(255, 228, 247, 255),
                          onTap: () {},
                        ),
                        AccountOption(
                          icon: Icons.notifications_outlined,
                          label: 'Notifications',
                          iconColor: Colors.green,
                          iconBackgroundColor:
                              const Color.fromARGB(255, 217, 255, 217),
                          onTap: () {},
                        ),
                        AccountOption(
                          icon: Icons.history_outlined,
                          label: 'Order History',
                          iconColor: Colors.yellow,
                          iconBackgroundColor:
                              const Color.fromARGB(255, 255, 252, 216),
                          onTap: () {},
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Text(
                            'General',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        AccountOption(
                          icon: Icons.lock_outline,
                          label: 'Privacy & Policy',
                          iconColor: Colors.blue,
                          iconBackgroundColor:
                              const Color.fromARGB(255, 207, 240, 255),
                          onTap: () {},
                        ),
                        AccountOption(
                          icon: Icons.info_outline,
                          label: 'Terms & Conditions',
                          iconColor: Colors.yellow,
                          iconBackgroundColor:
                              const Color.fromARGB(255, 255, 252, 216),
                          onTap: () {},
                        ),
                        AccountOption(
                          icon: Icons.logout_outlined,
                          label: 'Log Out',
                          iconColor: Colors.red,
                          iconBackgroundColor:
                              const Color.fromARGB(255, 255, 223, 223),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
