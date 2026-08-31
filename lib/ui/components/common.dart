import 'package:flutter/material.dart';

import '../../data/model/models.dart';
import '../../theme/app_theme.dart';

/// Componentes visuais reutilizáveis do app.
/// Equivalente ao arquivo `ui/components/Common.kt` do projeto Android original.

enum BadgeTone { brand, success, warning, danger, neutral }

class ClBadge extends StatelessWidget {
  final String texto;
  final BadgeTone tone;

  const ClBadge(this.texto, {super.key, this.tone = BadgeTone.brand});

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (tone) {
      BadgeTone.brand => (AppColors.brandLight, AppColors.brandDark),
      BadgeTone.success => (AppColors.successBg, AppColors.success),
      BadgeTone.warning => (AppColors.warningBg, AppColors.warning),
      BadgeTone.danger => (AppColors.dangerBg, AppColors.danger),
      BadgeTone.neutral => (AppColors.neutralBg, AppColors.slateMuted),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: fg,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

extension StatusAvaliacaoBadge on StatusAvaliacao {
  BadgeTone toBadgeTone() => switch (this) {
        StatusAvaliacao.aprovada => BadgeTone.success,
        StatusAvaliacao.pendente => BadgeTone.warning,
        StatusAvaliacao.reprovada => BadgeTone.danger,
      };
}

extension StatusColetaBadge on StatusColeta {
  BadgeTone toBadgeTone() => switch (this) {
        StatusColeta.concluida => BadgeTone.success,
        StatusColeta.agendada => BadgeTone.brand,
        StatusColeta.emColeta => BadgeTone.warning,
        StatusColeta.problema => BadgeTone.danger,
        StatusColeta.cancelada => BadgeTone.neutral,
      };
}

class ClPrimaryButton extends StatelessWidget {
  final String texto;
  final bool habilitado;
  final VoidCallback onPressed;

  const ClPrimaryButton({
    super.key,
    required this.texto,
    this.habilitado = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: habilitado ? onPressed : null,
      child: Text(texto),
    );
  }
}

class ClOutlineButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const ClOutlineButton({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(texto),
    );
  }
}

class ClCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  const ClCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    final card = Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
    if (onTap == null) return SizedBox(width: double.infinity, child: card);
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: card,
      ),
    );
  }
}

class ClTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  final VoidCallback? aoVoltar;

  const ClTopBar({super.key, required this.titulo, this.aoVoltar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titulo),
      automaticallyImplyLeading: false,
      leading: aoVoltar != null
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: aoVoltar,
              tooltip: 'Voltar',
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class Iniciais extends StatelessWidget {
  final String nome;
  final double tamanho;

  const Iniciais(this.nome, {super.key, this.tamanho = 56});

  @override
  Widget build(BuildContext context) {
    final iniciais = nome
        .split(' ')
        .where((s) => s.trim().isNotEmpty)
        .take(2)
        .map((s) => s[0].toUpperCase())
        .join();
    return Container(
      width: tamanho,
      height: tamanho,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.brand,
        shape: BoxShape.circle,
      ),
      child: Text(
        iniciais,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: tamanho / 2.8,
        ),
      ),
    );
  }
}
