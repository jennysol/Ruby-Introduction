require_relative "Produto"
class Livro
  attr_reader :editora
  
  include Produto

  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, possui_sobrecapa, editora)
    # @ Variável global main 
    super(titulo, preco, ano_lancamento, editora)
    @possui_reimpressao = possui_reimpressao
    @possui_sobrecapa = possui_sobrecapa
  end

  def matches?(query)
    ["livro", "impresso"].include?(query)
  end

  def possui_reimpressao?
    @possui_reimpressao
  end

  private

  def calcula_preco(base)
    if @ano_lancamento < 2006 
      if @possui_reimpressao 
        base * 0.9
      else 
        base *0.95
      end
    elsif @ano_lancamento <= 2010 
      base * 0.96
    else 
      base
    end
  end
end
