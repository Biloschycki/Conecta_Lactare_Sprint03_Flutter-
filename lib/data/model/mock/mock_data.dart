library;

import '../models.dart';

class MockData {
  MockData._();

  static final List<PerguntaQuiz> perguntasQuiz = [
    const PerguntaQuiz(
      id: 1,
      texto: 'Você está amamentando ou tirou leite nos últimos 12 meses?',
    ),
    const PerguntaQuiz(
      id: 2,
      texto: 'Você está em bom estado geral de saúde?',
    ),
    const PerguntaQuiz(
      id: 3,
      texto: 'Você não fuma nem usa outras substâncias?',
    ),
    const PerguntaQuiz(
      id: 4,
      texto: 'Você não faz uso de medicação incompatível com a doação?',
    ),
    const PerguntaQuiz(
      id: 5,
      texto: 'Você tem interesse em doar seu leite excedente regularmente?',
    ),
  ];

  static final List<BancoLeite> bancos = [
    const BancoLeite(
      id: 1,
      nome: 'Banco de Leite Humano — Hospital Pérola Byington',
      endereco: 'Av. Brigadeiro Luís Antônio',
      numero: '683',
      bairro: 'Bela Vista',
      cidade: 'São Paulo',
      estado: 'SP',
      telefone: '(11) 2176-1000',
      horarioFuncionamento: 'Seg a Sex, 7h às 19h',
      distanciaKm: 2.4,
      modalidades: [ModalidadeColeta.domiciliar, ModalidadeColeta.presencial],
    ),
    const BancoLeite(
      id: 2,
      nome: 'Banco de Leite — Hospital das Clínicas',
      endereco: 'Av. Dr. Enéas de Carvalho Aguiar',
      numero: '255',
      bairro: 'Cerqueira César',
      cidade: 'São Paulo',
      estado: 'SP',
      telefone: '(11) 2661-0000',
      horarioFuncionamento: 'Seg a Sáb, 8h às 18h',
      distanciaKm: 4.1,
      modalidades: [ModalidadeColeta.presencial],
    ),
    const BancoLeite(
      id: 3,
      nome: 'Banco de Leite Humano — Maternidade Municipal',
      endereco: 'Rua das Palmeiras',
      numero: '120',
      bairro: 'Jardim América',
      cidade: 'São Paulo',
      estado: 'SP',
      telefone: '(11) 3345-2200',
      horarioFuncionamento: 'Todos os dias, 24h',
      distanciaKm: 6.8,
      modalidades: [ModalidadeColeta.domiciliar, ModalidadeColeta.presencial],
    ),
  ];

  static final List<Conteudo> conteudos = [
    const Conteudo(
      id: 1,
      slug: 'como-armazenar-leite',
      titulo: 'Como armazenar seu leite corretamente',
      categoria: 'COLETA',
      tempoLeituraMin: 3,
      resumo:
          'Passo a passo para congelar e guardar o leite excedente com segurança.',
      corpo:
          'Use potes de vidro esterilizados, identifique com data e horário da ordenha, '
          'e mantenha congelado a -3°C ou menos até a coleta. Evite reaproveitar embalagens '
          'de outros alimentos e nunca misture leite de ordenhas em temperaturas diferentes '
          'no mesmo pote sem seguir a orientação do banco de leite.',
    ),
    const Conteudo(
      id: 2,
      slug: 'quem-pode-doar',
      titulo: 'Quem pode doar leite materno?',
      categoria: 'ELEGIBILIDADE',
      tempoLeituraMin: 2,
      resumo:
          'Entenda os critérios básicos de elegibilidade para se tornar doadora.',
      corpo:
          'Podem doar mulheres saudáveis que estejam amamentando e produzam leite '
          'excedente. Não é necessário estar com o bebê internado nem morar perto do banco '
          'de leite — o processo de triagem é feito pela equipe de saúde após o cadastro.',
    ),
    const Conteudo(
      id: 3,
      slug: 'impacto-da-doacao',
      titulo: 'O impacto de cada doação',
      categoria: 'IMPACTO',
      tempoLeituraMin: 4,
      resumo:
          'Veja como 1 litro de leite doado pode alimentar até 10 bebês prematuros.',
      corpo:
          'O leite humano pasteurizado é o principal alimento de recém-nascidos '
          'prematuros internados em UTI neonatal. Cada doação passa por controle de '
          'qualidade rigoroso antes de chegar até os bebês que mais precisam.',
    ),
    const Conteudo(
      id: 4,
      slug: 'cuidados-pos-parto',
      titulo: 'Cuidados com a amamentação no pós-parto',
      categoria: 'SAUDE',
      tempoLeituraMin: 5,
      resumo: 'Dicas práticas para manter a produção de leite de forma saudável.',
      corpo:
          'Hidrate-se bem, mantenha uma alimentação equilibrada e procure ordenhar em '
          'horários regulares. Em caso de dor, vermelhidão ou febre, procure orientação '
          'médica antes de continuar a amamentação ou doação.',
    ),
  ];

  static final Doadora doadoraAtual = Doadora(
    id: 1,
    nome: 'Mariana Silva Santos',
    email: 'mariana.silva@email.com',
    cpf: '12345678900',
    telefone: '11987654321',
    dataNascimento: '1994-03-12',
    pesoKg: 62.5,
    cep: '01310100',
    endereco: 'Av. Paulista',
    numero: '1000',
    complemento: 'Apto 52',
    bairro: 'Bela Vista',
    cidade: 'São Paulo',
    estado: 'SP',
    statusAvaliacao: StatusAvaliacao.aprovada,
    diaColetaSemana: 3, // quarta-feira
    doadoraDesde: '2025-11-02',
  );

  static final List<Coleta> coletas = [
    Coleta(
      id: 1,
      doadoraId: 1,
      banco: bancos[0],
      dataAgendada: '2026-08-19T09:00:00',
      modalidade: ModalidadeColeta.domiciliar,
      status: StatusColeta.agendada,
    ),
    Coleta(
      id: 2,
      doadoraId: 1,
      banco: bancos[0],
      dataAgendada: '2026-08-05T09:00:00',
      modalidade: ModalidadeColeta.domiciliar,
      status: StatusColeta.concluida,
      volumeMl: 850,
    ),
    Coleta(
      id: 3,
      doadoraId: 1,
      banco: bancos[1],
      dataAgendada: '2026-07-22T14:00:00',
      modalidade: ModalidadeColeta.presencial,
      status: StatusColeta.concluida,
      volumeMl: 620,
    ),
    Coleta(
      id: 4,
      doadoraId: 1,
      banco: bancos[0],
      dataAgendada: '2026-07-08T09:00:00',
      modalidade: ModalidadeColeta.domiciliar,
      status: StatusColeta.concluida,
      volumeMl: 700,
    ),
  ];

  static final List<Doadora> outrasDoadoras = [
    Doadora(
      id: 2,
      nome: 'Camila Rocha Oliveira',
      email: 'camila.rocha@email.com',
      cpf: '22233344455',
      telefone: '11911112222',
      dataNascimento: '1991-07-20',
      pesoKg: 58.0,
      cep: '04567000',
      endereco: 'Rua Vergueiro',
      numero: '500',
      bairro: 'Vila Mariana',
      cidade: 'São Paulo',
      estado: 'SP',
      statusAvaliacao: StatusAvaliacao.pendente,
      doadoraDesde: '2026-08-10',
    ),
    Doadora(
      id: 3,
      nome: 'Juliana Mendes Costa',
      email: 'juliana.mendes@email.com',
      cpf: '33344455566',
      telefone: '11922223333',
      dataNascimento: '1996-01-15',
      pesoKg: 65.2,
      cep: '05678000',
      endereco: 'Rua Augusta',
      numero: '220',
      bairro: 'Consolação',
      cidade: 'São Paulo',
      estado: 'SP',
      statusAvaliacao: StatusAvaliacao.aprovada,
      diaColetaSemana: 5,
      doadoraDesde: '2025-09-18',
    ),
    Doadora(
      id: 4,
      nome: 'Beatriz Almeida Souza',
      email: 'beatriz.almeida@email.com',
      cpf: '44455566677',
      telefone: '11933334444',
      dataNascimento: '1993-11-02',
      pesoKg: 60.0,
      cep: '03456000',
      endereco: 'Rua Cardeal Arcoverde',
      numero: '80',
      bairro: 'Pinheiros',
      cidade: 'São Paulo',
      estado: 'SP',
      statusAvaliacao: StatusAvaliacao.pendente,
      doadoraDesde: '2026-08-14',
    ),
    Doadora(
      id: 5,
      nome: 'Fernanda Lima Costa',
      email: 'fernanda.lima@email.com',
      cpf: '55566677788',
      telefone: '11944445555',
      dataNascimento: '1990-05-30',
      pesoKg: 70.1,
      cep: '02345000',
      endereco: 'Rua Cotoxó',
      numero: '12',
      bairro: 'Perdizes',
      cidade: 'São Paulo',
      estado: 'SP',
      statusAvaliacao: StatusAvaliacao.reprovada,
      doadoraDesde: '2026-06-01',
    ),
  ];

  static final List<ItemAvaliacao> filaAvaliacao = [
    ItemAvaliacao(
      id: 1,
      doadora: outrasDoadoras[0],
      dataSolicitacao: '2026-08-14',
    ),
    ItemAvaliacao(
      id: 2,
      doadora: outrasDoadoras[2],
      dataSolicitacao: '2026-08-15',
    ),
  ];

  static final List<LogAuditoria> auditoria = [
    const LogAuditoria(
      id: 1,
      autor: 'Dra. Renata Alves',
      acao: 'Aprovou cadastro',
      alvo: 'Juliana Mendes Costa',
      dataHora: '2026-08-12 10:22',
    ),
    const LogAuditoria(
      id: 2,
      autor: 'Enf. Paulo Torres',
      acao: 'Reprovou cadastro',
      alvo: 'Fernanda Lima Costa',
      dataHora: '2026-06-02 15:40',
    ),
    const LogAuditoria(
      id: 3,
      autor: 'Dra. Renata Alves',
      acao: 'Editou conteúdo',
      alvo: 'Como armazenar seu leite corretamente',
      dataHora: '2026-08-05 09:15',
    ),
    const LogAuditoria(
      id: 4,
      autor: 'Enf. Paulo Torres',
      acao: 'Confirmou coleta',
      alvo: 'Mariana Silva Santos',
      dataHora: '2026-08-05 09:05',
    ),
  ];

  static List<Doadora> todasDoadoras() => [doadoraAtual, ...outrasDoadoras];

  static double totalLitrosPlataforma() =>
      coletas
          .where((c) => c.status == StatusColeta.concluida)
          .fold<int>(0, (soma, c) => soma + (c.volumeMl ?? 0)) /
      1000.0;
}