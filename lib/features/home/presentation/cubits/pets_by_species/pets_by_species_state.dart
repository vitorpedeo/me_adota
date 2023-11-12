part of 'pets_by_species_cubit.dart';

class PetsBySpeciesState extends Equatable {
  final List<SpeciesFilterModel> filters = [
    SpeciesFilterModel(
      name: 'Cachorros',
      icon: PhosphorIcons.dog(
        PhosphorIconsStyle.bold,
      ),
    ),
    SpeciesFilterModel(
      name: 'Gatos',
      icon: PhosphorIcons.cat(
        PhosphorIconsStyle.bold,
      ),
    ),
  ];
  final SpeciesFilterModel? selectedFilter;

  PetsBySpeciesState({
    this.selectedFilter,
  });

  @override
  List<Object?> get props => [
        filters,
        selectedFilter,
      ];
}
