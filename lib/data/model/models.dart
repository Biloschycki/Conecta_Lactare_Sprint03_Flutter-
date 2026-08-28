library;

enum StatusAvaliacao {
  pendente('Em avaliação'),
  aprovada('Aprovada'),
  reprovada('Não aprovada');

  final String label;
  const StatusAvaliacao(this.label);
}

enum StatusColeta {
  agendada('Agendada'),
  emColeta('Em coleta'),
  concluida('Concluída'),
  problema('Problema'),
  cancelada('Cancelada');

  final String label;
  const StatusColeta(this.label);
}

enum ModalidadeColeta {
  domiciliar('Coleta em casa'),
  presencial('Levar ao banco');

  final String label;
  const ModalidadeColeta(this.label);
}

enum PapelUsuario {
  doadora('Doadora'),
  gestor('Gestor');

  final String label;
  const PapelUsuario(this.label);
}

class Doadora {
  final int id;
  String nome;
  String email;
  final String cpf;
  String telefone;
  final String dataNascimento;
  final double pesoKg;
  final String cep;
  final String endereco;
  final String numero;
  final String complemento;
  final String bairro;
  final String cidade;
  final String estado;
  StatusAvaliacao statusAvaliacao;
  int? diaColetaSemana; // 0=domingo ... 6=sábado
  final String doadoraDesde;

  Doadora({
    required this.id,
    required this.nome,
    required this.email,
    required this.cpf,
    required this.telefone,
    required this.dataNascimento,
    required this.pesoKg,
    required this.cep,
    required this.endereco,
    required this.numero,
    this.complemento = '',
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.statusAvaliacao,
    this.diaColetaSemana,
    required this.doadoraDesde,
  });
}

class BancoLeite {
  final int id;
  final String nome;
  final String endereco;
  final String numero;
  final String bairro;
  final String cidade;
  final String estado;
  final String telefone;
  final String horarioFuncionamento;
  final double distanciaKm;
  final List<ModalidadeColeta> modalidades;

  const BancoLeite({
    required this.id,
    required this.nome,
    required this.endereco,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.telefone,
    required this.horarioFuncionamento,
    required this.distanciaKm,
    required this.modalidades,
  });
}

class Coleta {
  final int id;
  final int doadoraId;
  final BancoLeite banco;
  final String dataAgendada;
  final ModalidadeColeta modalidade;
  StatusColeta status;
  final int? volumeMl;

  Coleta({
    required this.id,
    required this.doadoraId,
    required this.banco,
    required this.dataAgendada,
    required this.modalidade,
    required this.status,
    this.volumeMl,
  });
}

class Conteudo {
  final int id;
  final String slug;
  final String titulo;
  final String categoria;
  final int tempoLeituraMin;
  final String resumo;
  final String corpo;

  const Conteudo({
    required this.id,
    required this.slug,
    required this.titulo,
    required this.categoria,
    required this.tempoLeituraMin,
    required this.resumo,
    required this.corpo,
  });
}

class PerguntaQuiz {
  final int id;
  final String texto;

  const PerguntaQuiz({required this.id, required this.texto});
}

class ItemAvaliacao {
  final int id;
  final Doadora doadora;
  final String dataSolicitacao;

  const ItemAvaliacao({
    required this.id,
    required this.doadora,
    required this.dataSolicitacao,
  });
}

class LogAuditoria {
  final int id;
  final String autor;
  final String acao;
  final String alvo;
  final String dataHora;

  const LogAuditoria({
    required this.id,
    required this.autor,
    required this.acao,
    required this.alvo,
    required this.dataHora,
  });
}