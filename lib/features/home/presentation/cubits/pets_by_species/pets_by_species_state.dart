part of 'pets_by_species_cubit.dart';

class PetsBySpeciesState extends Equatable {
  final List<SpeciesFilterModel> filters = [
    SpeciesFilterModel(
      name: 'Cachorros',
      icon: PhosphorIcons.bold.dog,
    ),
    SpeciesFilterModel(
      name: 'Gatos',
      icon: PhosphorIcons.bold.cat,
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
