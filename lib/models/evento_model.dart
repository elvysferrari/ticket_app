import 'package:intl/intl.dart';

class EventoModel {
  int? id;
  String? nome;
  String? descricao;
  String? urlImagem;
  String? dataHoraInicio;
  String? dataHoraFim;
  String? informacoes;
  int? categoriaId;
  String? categoria;
  String? localEvento;
  String? localEndereco;
  String? localNumero;
  String? localBairro;
  String? localCidade;
  String? localUF;
  String? organizador;
  String? destaque;

  EventoModel(
      {this.id,
        required this.nome,
        this.descricao,
        this.urlImagem,
        this.dataHoraInicio,
        this.dataHoraFim,
        this.informacoes,
        this.categoriaId,
        this.categoria,
        this.localEvento,
        this.localEndereco,
        this.localNumero,
        this.localBairro,
        this.localCidade,
        this.localUF,
        this.organizador,
        this.destaque});

  EventoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    urlImagem = json['urlImagem'];
    dataHoraInicio = json['dataHoraInicio'];
    dataHoraFim = json['dataHoraFim'];
    informacoes = json['informacoes'];
    categoriaId = json['categoriaId'];
    categoria = json['categoria'];
    localEvento = json['localEvento'];
    localEndereco = json['localEndereco'];
    localNumero = json['localNumero'];
    localBairro = json['localBairro'];
    localCidade = json['localCidade'];
    localUF = json['localUF'];
    organizador = json['organizador'];
    destaque = json['destaque'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['urlImagem'] = this.urlImagem;
    data['dataHoraInicio'] = this.dataHoraInicio;
    data['dataHoraFim'] = this.dataHoraFim;
    data['informacoes'] = this.informacoes;
    data['categoriaId'] = this.categoriaId;
    data['categoria'] = this.categoria;
    data['localEvento'] = this.localEvento;
    data['localEndereco'] = this.localEndereco;
    data['localNumero'] = this.localNumero;
    data['localBairro'] = this.localBairro;
    data['localCidade'] = this.localCidade;
    data['localUF'] = this.localUF;
    data['organizador'] = this.organizador;
    data['destaque'] = this.destaque;
    return data;
  }

  retornaEndereco(){
      return '${this.localEndereco}, ${this.localNumero} - ${this.localBairro}, ${this.localCidade} - ${this.localUF}' ;
  }

  retornaEnderecoMapa(){
    return '${this.localEndereco}, ${this.localNumero} - ${this.localBairro}, ${this.localCidade} - ${this.localUF}' ;
  }

  retornaDataInicioFim(String tipoData){
    String retorno = "";

    if(tipoData == "DATA"){
      String dataInicio = "${DateFormat.MMMEd('pt').format(DateTime.parse(this.dataHoraInicio!))} - ${DateFormat.y('pt').format(DateTime.parse(this.dataHoraInicio!))}";
      String dataFinal = dataInicio = "${DateFormat.MMMEd('pt').format(DateTime.parse(this.dataHoraFim!))} - ${DateFormat.y('pt').format(DateTime.parse(this.dataHoraFim!))}";
      retorno = ('${dataInicio} - ${dataFinal}').toUpperCase();
    }
    if(tipoData == "HORA"){
      String dataInicioHora = DateFormat('HH', 'pt')
          .format(DateTime.parse(this.dataHoraInicio!));
      String dataInicioMinuto = DateFormat('mm', 'pt')
          .format(DateTime.parse(this.dataHoraInicio!));
      String dataFimHora = DateFormat('HH', 'pt')
          .format(DateTime.parse(this.dataHoraInicio!));
      String dataFimMinuto = DateFormat('mm', 'pt')
          .format(DateTime.parse(this.dataHoraInicio!));

      retorno = '${dataInicioHora}h ${dataInicioMinuto}m - ${dataFimHora}h ${dataFimMinuto}m';
    }

    return '${retorno}' ;
  }
}