mixin ValidacoesMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) {
      return message ?? 'Este campo é obrigatório';
    }
    return null;
  }

  String? validaNome(String? value, [String? message]) {
    var valida = value!.trim().replaceAll(RegExp(r' \s+'), ' ');
    if (valida.length < 3) {
      return 'Informe um nove válido';
    }
    return null;
  }

  String? validaFormatoEmail(String? value, [String? message]) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!)) {
      return 'Email inválido';
    }
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
