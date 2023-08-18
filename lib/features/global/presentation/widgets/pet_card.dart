import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:me_adota/config/theme/app_theme.dart';

enum PetCardType {
  horizontal,
  vertical,
}

class PetCard extends StatelessWidget {
  final PetCardType type;

  const PetCard({super.key, this.type = PetCardType.vertical});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: type == PetCardType.vertical
              ? const EdgeInsets.only(
                  top: 8,
                  right: 8,
                  bottom: 16,
                  left: 8,
                )
              : const EdgeInsets.all(
                  16,
                ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.gray,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
            color: AppTheme.white,
          ),
          child: type == PetCardType.vertical
              ? _buildVerticalCard()
              : _buildHorizontalCard(),
        ),
        Positioned(
          top: -4,
          right: -4,
          child: Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.pink,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          child: CachedNetworkImage(
            width: 140,
            height: 100,
            fit: BoxFit.cover,
            imageUrl:
                'https://blog.petiko.com.br/wp-content/uploads/2018/05/cachorro-fofo.jpg',
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 140,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Márcio',
                  style: AppTheme.bodyBold.copyWith(
                    color: AppTheme.bodyText,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'SRD',
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.captionRegular.copyWith(
                          color: AppTheme.bodySecondaryText,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: const BoxDecoration(
                        color: AppTheme.pinkAlpha,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            24,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '2 anos',
                          style: AppTheme.overlineBold.copyWith(
                            color: AppTheme.pink,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          child: CachedNetworkImage(
            width: 100,
            height: 80,
            fit: BoxFit.cover,
            imageUrl:
                'https://blog.petiko.com.br/wp-content/uploads/2018/05/cachorro-fofo.jpg',
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Márcio',
              style: AppTheme.bodyBold.copyWith(
                color: AppTheme.bodyText,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'SRD',
              overflow: TextOverflow.ellipsis,
              style: AppTheme.captionRegular.copyWith(
                color: AppTheme.bodySecondaryText,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: const BoxDecoration(
                color: AppTheme.pinkAlpha,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    24,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  '2 anos',
                  style: AppTheme.overlineBold.copyWith(
                    color: AppTheme.pink,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
