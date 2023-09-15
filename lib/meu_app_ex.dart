import 'dart:convert';
import 'dart:io';

import 'package:meu_app_ex/excepetion/nome_invalido_exception.dart';
import 'package:meu_app_ex/models/console_utils.dart';

import 'models/aluno.dart';

void execute() {
  print('Bem vindo ao sistema de notas');
  String nome = ConsoleUtils.lerStringComTexto('Digite o nome do aluno: ');
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } catch (NomeInvalidoException) {
    nome = "Nome padrão";
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
  }

  var aluno = Aluno(nome);
  double? nota;
  do {
    nota = ConsoleUtils.lerDoubleComTextoComSaida(
        'Digite a nota ou s para sair', 's');
    if (nota != null) {
      aluno.adicionarNota(nota);
    }
  } while (nota != null);
  print(aluno.getNotas());
  print(aluno.retornaMedia());
  if (aluno.aprovado(7)) {
    print('Aluno ${aluno.getNome()} foi aprovado');
  } else {
    print('Aluno ${aluno.getNome()} foi reprovado');
  }
}
