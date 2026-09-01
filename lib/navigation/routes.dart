class Routes {
  Routes._();

  static const landing = '/landing';
  static const quiz = '/quiz';
  static const resultadoElegivel = '/resultado-elegivel';
  static const resultadoInelegivel = '/resultado-inelegivel';
  static const cadastro = '/cadastro';
  static const login = '/login';

  static const doadoraRoot = '/doadora';
  static const doadoraInicio = '/doadora/inicio';
  static const doadoraColetas = '/doadora/coletas';
  static const doadoraNovaColeta = 'nova-coleta'; // filha de coletas
  static const doadoraBancos = '/doadora/bancos';
  static const doadoraConteudo = '/doadora/conteudo';
  static const doadoraConteudoDetalhe = ':slug'; // filha de conteudo
  static const doadoraPerfil = '/doadora/perfil';

  static const gestorRoot = '/gestor';
  static const gestorVisaoGeral = '/gestor/visao-geral';
  static const gestorAvaliacoes = '/gestor/avaliacoes';
  static const gestorDoadoras = '/gestor/doadoras';
  static const gestorColetas = '/gestor/coletas';
  static const gestorConteudo = '/gestor/conteudo';
  static const gestorAuditoria = '/gestor/auditoria';
}
