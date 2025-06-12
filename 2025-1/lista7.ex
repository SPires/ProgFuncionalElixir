# Questão 1
defmodule Hailstone do
	def seq(1), do: [1]
	def seq(n) when is_integer(n) and n > 0 and rem(n,2) == 0 do
		[n] ++ seq(div(n,2))
	end
	def seq(n) when is_integer(n) and n > 0 and rem(n,2) == 1 do
		[n] ++ seq(3*n+1)
	end
	def seq(_), do: :erro
end

# Questão 2
defmodule Functions do
	# Função de Ackerman
	def ack(0,n) when is_integer(n) and n > 0 do
		n+1
	end
	def ack(m,0) when is_integer(m) and m > 0 do
		ack(m-1,1)
	end
	def ack(m,n) when is_integer(n) and is_integer(m) and m > 0 and n > 0 do
		ack(m-1,ack(m,n-1))
	end
	
	# Desarranjo
	def des(1), do: 0
	def des(2), do: 1
	def des(n) when n > 2, do: (n-1)*(des(n-1)+des(n-2))
	def des(_), do: :erro
	
	# Somatório de alta ordem
	def sum(0,f) when is_function(f), do: f.(0)
	def sum(x,f) when is_integer(x) and is_function(f) and x > 0 do
		f.(x) + sum(x-1,f)
	end
	def sum(_,_), do: :erro
	
	# Sequência de Recamán
	def rcm(0), do: [0]
	def rcm(n) when is_integer(n) do
		x = rcm(n-1)
		y = List.last(x) - n
		if ((y > 0) and not(y in x)) do
			x ++ [y]
		else
			x ++ [List.last(x)+n]
		end
	end 
end

# Questão 3
defmodule HOFun do
	def trickle(f,x,y) when is_function(f) and is_list(x) and is_list(y) and length(x) == length(y) and length(x) == 1 do
		if f.(hd(x),hd(y)) do
			[hd(x)]
		else
			[hd(y)]
		end
	end
	def trickle(f,x,y) when is_function(f) and is_list(x) and is_list(y) and length(x) == length(y) do
		if f.(hd(x),hd(y)) do
			[hd(x)] ++ trickle(f,tl(x),tl(y))
		else
			[hd(y)] ++ trickle(f,tl(x),tl(y))
		end
	end
	def trickle(_,_,_), do: :erro
end

# Questão 4
defmodule MergeSort do
	# Aplicação do procedimento de partição
	def on(l) when is_list(l) and length(l) == 1 do
		l
	end
	def on(l) when is_list(l) do
		merge(on(Enum.slice(l,0..div(length(l),2)-1)),on(Enum.slice(l,div(length(l),2)..length(l))))
	end
	# Procedimento de intercalação
	defp merge([],y) when is_list(y), do: y
	defp merge(x,[]) when is_list(x), do: x
	defp merge(x,y) when is_list(x) and is_list(y) do
		if hd(x) < hd(y) do
			[hd(x)] ++ merge(tl(x),y)
		else
			[hd(y)] ++ merge(x,tl(y))
		end
	end
end