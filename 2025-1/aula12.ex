# Exemplo do slide 6 da aula 12
defmodule Loop do
    def println(0), do: :ok
    def println(n) when is_integer(n) and n > 0 do
        IO.puts("Linha #{Integer.to_string(n)}")
        println(n-1)
    end
end

# Gabarito dos exercícios do slide 7
defmodule Combinatoria do
	defp fatorial(0), do: 1
	defp fatorial(n) when is_integer(n) and n > 0, do: n * fatorial(n-1)
	defp fatorial(_), do: :erro
	def permutação(n), do: fatorial(n)
	def permutação_circular(n), do: fatorial(n-1)
	def arranjo_simples(n,p) when is_integer(n) and is_integer(p) and p <= n do
		div(fatorial(n),fatorial(n-p))
	end
	def arranjo_simples(_,_), do: :erro
	def combinação_simples(n,p) when is_integer(n) and is_integer(p) and p <= n do
		div(fatorial(n),fatorial(p)*fatorial(n-p))
	end
	def combinação_simples(_,_), do: :erro
	def arranjo_repetição(n,p) when is_integer(n) and is_integer(p) do
		Integer.pow(n,p)
	end
	def arranjo_repetição(_,_), do: :erro
	def combinação_repetição(n,p) when is_integer(n) and is_integer(p) do
		combinação_simples(n+p-1,p)
	end
	def combinação_repetição(_,_), do: :erro
end

# Gabarito dos exercícios do slide 19
defmodule Exercicios do
	def combine(f,x,y) when is_function(f) and is_list(x) and is_list(y) and length(x) == length(y) and length(x) == 1 do
		[f.(hd(x),hd(y))]
	end
	def combine(f,x,y) when is_function(f) and is_list(x) and is_list(y) and length(x) == length(y) do
		[f.(hd(x),hd(y))] ++ combine(f,tl(x),tl(y))
	end
	def combine(_,_,_), do: :erro
	
	# Montagem de uma lista de números inteiros com inserção manual de dados
	# Ao digitar 0, a inserção é terminada e a lista completa é retornada
	def inn() do
		x = String.to_integer(String.trim(IO.gets("Digite um número: ")))
		if x == 0 do
			[]
		else
			[x] ++ inn()
		end
	end
	
	def summation(0), do: 0
	def summation(n) when is_integer(n) and n > 0 do
		Integer.pow(2,n) - 1 + summation(n-1)
	end
	def summation(_), do: :erro
end
