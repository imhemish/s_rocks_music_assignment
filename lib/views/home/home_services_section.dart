import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/service_viewmodel.dart';
import '../../widgets/service_card.dart';

class HomeServicesSection extends StatelessWidget {
  const HomeServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<ServiceViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF8B1538),
              ),
            );
          }

          if (viewModel.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${viewModel.error}',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.clearError();
                      viewModel.loadServices();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (viewModel.services.isEmpty) {
            return const Center(
              child: Text(
                'No services available',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
            
            padding: const EdgeInsets.symmetric(vertical: 0),
            itemCount: viewModel.services.length,
            itemBuilder: (context, index) {
              return ServiceCardWidget(
                service: viewModel.services[index],
              );
            },
          );
        },
      ),
    );
  }
}