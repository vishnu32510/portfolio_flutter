import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';

class SkillChip extends StatelessWidget {
  const SkillChip({
    super.key,
    required this.skillName,
    this.compact = false,
  });

  final String skillName;
  final bool compact;

  String? _logoAssetForSkill(String skill) {
    final s = skill.toLowerCase();
    // Languages
    if (s == 'python') return 'assets/logo/python.svg';
    if (s == 'javascript') return 'assets/logo/javascript.svg';
    if (s == 'typescript') return 'assets/logo/typescript.svg';
    if (s == 'dart') return 'assets/logo/dart.svg';
    if (s == 'kotlin') return 'assets/logo/kotlin.svg';
    if (s == 'swift') return 'assets/logo/swift.svg';
    if (s == 'java') return 'assets/logo/java.svg';
    if (s == 'c' || s == 'c++') return 'assets/logo/c.svg';
    if (s == 'html') return 'assets/logo/html.svg';
    if (s == 'css') return 'assets/logo/css.svg';

    // Frameworks & libs
    if (s.contains('react')) return 'assets/logo/react.svg';
    if (s.contains('node')) return 'assets/logo/node.svg';
    if (s.contains('express')) return 'assets/logo/express.svg';
    if (s.contains('flask')) return 'assets/logo/python.svg';
    if (s.contains('fastapi')) return 'assets/logo/fastapi.svg';
    if (s.contains('graphql')) return 'assets/logo/graphql.svg';
    if (s.contains('nginx')) return 'assets/logo/nginx.svg';

    // Cloud / DevOps
    if (s.contains('firebase')) return 'assets/logo/firebase.svg';
    if (s.contains('gcp') || s.contains('google cloud')) return 'assets/logo/gcp.svg';
    if (s.contains('aws')) return 'assets/logo/aws.svg';
    if (s.contains('docker')) return 'assets/logo/docker.svg';
    if (s.contains('kubernetes')) return 'assets/logo/kubernetes.svg';
    if (s.contains('jenkins')) return 'assets/logo/jenkins.svg';
    if (s == 'git') return 'assets/logo/git.svg';
    if (s.contains('github actions')) return 'assets/logo/github_actions.svg';

    // Data
    if (s.contains('postgres')) return 'assets/logo/postgresql.svg';
    if (s.contains('mongodb')) return 'assets/logo/mongodb.svg';
    if (s.contains('mysql')) return 'assets/logo/mysql.svg';

    // AI
    if (s.contains('tensorflow')) return 'assets/logo/tensorflow.svg';
    if (s.contains('opencv')) return 'assets/logo/opencv.svg';
    if (s.contains('langchain')) return 'assets/logo/langchain.svg';
    if (s.contains('vertex')) return 'assets/logo/vertexai.svg';
    if (s.contains('huggingface')) return 'assets/logo/huggingface.svg';
    if (s.contains('pinecone')) return 'assets/logo/pinecone.svg';

    // Mobile
    if (s.contains('flutter')) return 'assets/logo/flutter.svg';

    return null;
  }

  MapEntry<IconData, Color?> _iconForSkill(String skill, ColorScheme colors) {
    final s = skill.toLowerCase();
    if (s.contains('python')) return MapEntry(FontAwesomeIcons.python, const Color(0xFF3776AB));
    if (s.contains('javascript')) return MapEntry(FontAwesomeIcons.js, const Color(0xFFF7DF1E));
    if (s.contains('typescript')) return MapEntry(FontAwesomeIcons.js, const Color(0xFF3178C6));
    if (s == 'dart') return MapEntry(FontAwesomeIcons.code, const Color(0xFF0175C2));
    if (s.contains('kotlin')) return MapEntry(FontAwesomeIcons.android, const Color(0xFF7F52FF));
    if (s.contains('swift')) return MapEntry(FontAwesomeIcons.swift, const Color(0xFFFA7343));
    if (s == 'go') return MapEntry(FontAwesomeIcons.golang, const Color(0xFF00ADD8));
    if (s == 'c' || s == 'c++' || s.contains('c++')) return MapEntry(FontAwesomeIcons.c, const Color(0xFFA8B9CC));
    if (s == 'java') return MapEntry(FontAwesomeIcons.java, const Color(0xFFE11F21));
    if (s.contains('rust')) return MapEntry(FontAwesomeIcons.gear, const Color(0xFFDEA584));
    if (s.contains('html')) return MapEntry(FontAwesomeIcons.html5, const Color(0xFFE34F26));
    if (s.contains('css')) return MapEntry(FontAwesomeIcons.css3Alt, const Color(0xFF1572B6));
    if (s.contains('flutter')) return MapEntry(FontAwesomeIcons.mobileScreen, const Color(0xFF02569B));
    if (s.contains('jetpack') || s.contains('compose')) return MapEntry(FontAwesomeIcons.android, const Color(0xFF3DDC84));
    if (s.contains('swiftui')) return MapEntry(FontAwesomeIcons.apple, const Color(0xFF0A84FF));
    if (s.contains('bloc')) return MapEntry(FontAwesomeIcons.diagramProject, const Color(0xFF7C4DFF));
    if (s.contains('redux')) return MapEntry(FontAwesomeIcons.shuffle, const Color(0xFF764ABC));
    if (s.contains('mvvm')) return MapEntry(FontAwesomeIcons.layerGroup, colors.primary);
    if (s.contains('junit')) return MapEntry(FontAwesomeIcons.vial, const Color(0xFF25A162));
    if (s.contains('mockito')) return MapEntry(FontAwesomeIcons.userSecret, const Color(0xFF4CAF50));
    if (s.contains('xctest')) return MapEntry(FontAwesomeIcons.checkDouble, const Color(0xFF0A84FF));
    if (s.contains('a11y') || s.contains('accessibility')) return MapEntry(FontAwesomeIcons.universalAccess, const Color(0xFF4CAF50));
    if (s.contains('firebase')) return MapEntry(FontAwesomeIcons.fire, const Color(0xFFFFCA28));
    if (s.contains('gcp') || s.contains('google cloud')) return MapEntry(FontAwesomeIcons.cloud, const Color(0xFF4285F4));
    if (s.contains('aws')) return MapEntry(FontAwesomeIcons.cloudArrowUp, const Color(0xFFFF9900));
    if (s.contains('azure')) return MapEntry(FontAwesomeIcons.cloudBolt, const Color(0xFF0089D6));
    if (s.contains('docker')) return MapEntry(FontAwesomeIcons.docker, const Color(0xFF2496ED));
    if (s.contains('kafka')) return MapEntry(FontAwesomeIcons.waveSquare, const Color(0xFF231F20));
    if (s.contains('rabbitmq')) return MapEntry(FontAwesomeIcons.envelopeOpenText, const Color(0xFFFF6600));
    if (s.contains('graphql')) return MapEntry(FontAwesomeIcons.diagramProject, const Color(0xFFE535AB));
    if (s.contains('grpc')) return MapEntry(FontAwesomeIcons.plug, const Color(0xFF3D9B35));
    if (s.contains('rest')) return MapEntry(FontAwesomeIcons.link, colors.primary);
    if (s.contains('etl')) return MapEntry(FontAwesomeIcons.gear, colors.primary);
    if (s.contains('node')) return MapEntry(FontAwesomeIcons.nodeJs, const Color(0xFF83CD29));
    if (s.contains('react')) return MapEntry(FontAwesomeIcons.react, const Color(0xFF61DAFB));
    if (s.contains('next')) return MapEntry(FontAwesomeIcons.arrowRight, Colors.black);
    if (s.contains('angular')) return MapEntry(FontAwesomeIcons.a, const Color(0xFFDD0031));
    if (s.contains('flask')) return MapEntry(FontAwesomeIcons.flask, Colors.black);
    if (s.contains('gin')) return MapEntry(FontAwesomeIcons.bottleDroplet, const Color(0xFF32CD32));
    if (s.contains('play framework')) return MapEntry(FontAwesomeIcons.play, const Color(0xFF82BF39));
    if (s.contains('room')) return MapEntry(FontAwesomeIcons.database, const Color(0xFF009688));
    if (s.contains('dagger') || s.contains('hilt')) return MapEntry(FontAwesomeIcons.shield, const Color(0xFFFF9800));
    if (s.contains('mocha')) return MapEntry(FontAwesomeIcons.mugHot, const Color(0xFF8D6748));
    if (s.contains('ci/cd')) return MapEntry(FontAwesomeIcons.arrowsRotate, const Color(0xFF607D8B));
    if (s.contains('jenkins')) return MapEntry(FontAwesomeIcons.userGear, const Color(0xFFD33833));
    if (s.contains('git')) return MapEntry(FontAwesomeIcons.codeBranch, const Color(0xFFF05032));
    if (s.contains('pub/sub')) return MapEntry(FontAwesomeIcons.message, const Color(0xFF4285F4));
    if (s.contains('llm') || s.contains('rag') || s.contains('mcp')) return MapEntry(FontAwesomeIcons.robot, const Color(0xFF9C27B0));
    return MapEntry(FontAwesomeIcons.circleCheck, colors.primary);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final logoAsset = _logoAssetForSkill(skillName);
    final iconEntry = _iconForSkill(skillName, colors);

    return Container(
      decoration: BoxDecoration(
        color: colors.onSurface.withValues(alpha: 0.05),
        borderRadius: compact ? AppSizes.borderRadiusXS : AppSizes.borderRadiusSmall,
        border: Border.all(
          width: 0.6,
          color: colors.outline,
        ),
      ),
      padding: compact
          ? AppSizes.paddingXS
          : EdgeInsets.symmetric(
              horizontal: AppSizes.spacingSmallRegular,
              vertical: AppSizes.spacingXS,
            ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (logoAsset != null)
            SvgPicture.asset(
              logoAsset,
              height: compact ? AppSizes.iconXS : AppSizes.iconSmall,
              width: compact ? AppSizes.iconXS : AppSizes.iconSmall,
            )
          else
            Icon(
              iconEntry.key,
              size: compact ? AppSizes.iconXS : AppSizes.iconSmall,
              color: iconEntry.value ?? colors.primary,
            ),
          SizedBox(width: AppSizes.spacingSmall),
          Text(
            skillName,
            style: compact
                ? AppStyles.extraSmallTextThin(
                    textColor: colors.primary,
                  )
                : AppStyles.smallTextThin(
                    textColor: colors.primary,
                  ),
          ),
        ],
      ),
    );
  }
}
