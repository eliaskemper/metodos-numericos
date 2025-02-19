### A Pluto.jl notebook ###
# v0.14.8

using Markdown
using InteractiveUtils

# ╔═╡ 79afca88-d86b-45be-993d-2a7bea872982
using PlutoUI

# ╔═╡ e45bbc21-b1dd-492e-8550-22b080a5ad9a
md"""
# Algoritmos numéricos com Julia

## Comandos Básicos
"""

# ╔═╡ 51f9e287-17b4-4949-8ece-b081d2ae8cf3
7 * 3

# ╔═╡ 2b049859-05a8-4c03-985f-a048ad3403c8
1+1

# ╔═╡ 993ffa94-cefe-11eb-218c-e1a48fc361a8
1-1

# ╔═╡ fcee9fab-488c-49b3-add5-39fc7b095e95
2+3

# ╔═╡ ce5b18af-a1e0-4fb0-b6a0-757869765d37
7 ^ 8

# ╔═╡ 0a0dd88f-ae9e-4b21-9931-da6178d5324b
sin(pi/4)

# ╔═╡ 92a2f02e-f83b-4f3e-8af3-7de014a76864
x = 11

# ╔═╡ e607addd-9e0a-4037-b9f2-fedf8912de81
x^2

# ╔═╡ 27114178-876e-4458-9d37-5f11c8625846
exp(x)

# ╔═╡ 6994acf6-9aa3-4177-8b20-f40affbbb02e
5.8e-2 #5.8 × 10^(-2)

# ╔═╡ afb15742-9fa7-4de6-b0a4-51fed78c181f
0.1 + 0.2 - 0.3

# ╔═╡ ee9edf86-f035-44b0-9e4b-1bc34ab7a1b0
-0.3 + 0.1 + 0.2

# ╔═╡ 9590b96e-0d3c-47bd-a238-a0d72dfbdb8d
-0.3 + 0.2 + 0.1

# ╔═╡ b04f4fc2-ebde-4901-aa9f-0315f379b715
md"""
#### Pluto é REATIVO

- Qualquer alteração em uma célula é refletida em todas as outras células
"""

# ╔═╡ 6d0293c3-a67d-4ed1-8dbf-4b549282af2e
begin
	y = 4
	z = 8
end

# ╔═╡ ab9dea6e-0ee2-4424-8e9b-6b5832329e5a
z + x

# ╔═╡ 12d93f85-309c-4b4a-8e8b-28bd5ec4381b
md"""
#### Pacote `PlutoUI.jl`
"""

# ╔═╡ 169f6fe6-9420-4460-aa51-df4c7f6cce63
# using Pkg; Pkg.add("PlutoUI")

# ╔═╡ 600ee512-b3c0-4b62-8bbc-4fde624325f2
md"""
- Usando função `with_terminal()`
"""

# ╔═╡ 4e192825-1212-48bb-bdff-b575fe3997a2
begin
	println("Hello, ")
    println("World!")
end

# ╔═╡ d048bcf5-221f-4df7-8e7c-1383e398d6a0
with_terminal() do
	println("Hello, ")
    println("World!")
	@show 2+3 
	@show x # @show  x equivale à println("x = $x")
	println("x = $x")
	@show y
end

# ╔═╡ 44ea2c67-9e6a-4b93-894f-2a3b66d6a42a
@show "x é variável valendo $x"

# ╔═╡ 05461694-b4c4-4a2e-8f9f-01574dca4919
md"""
## Calculando Raízes quadradas

Vamos agora implementar nosso Algoritmo para encontrar raízes quadradas de um inteiro $n>0$. 

- Quero encontrar ${m \in \mathbb{Z}}$  tal que ${m^2 = n}$.
"""

# ╔═╡ 2dd983c1-288d-48b5-b12f-1ac281b5e6ad
with_terminal() do
	n = 48
	for m in 1:n
		if m^2 == n
			# Declarar m como raiz quadrada de n
			println("$m é raiz quadrada de $n")
			break
		end
		if m^2 > n
			# Declarar que n não possui raiz quadrada inteira
			println("$n não tem raiz quadrada inteira")
			println("A raiz de $n está entre $(m-1) e $m")
			break
		end
	end
end

# ╔═╡ 9bfd6085-389b-4f81-897c-2c8591977fd1
md"""
### Funções
- Em Julia funções tem a estrutura
```julia
function nome_func(input1, input2, ...)
	#Comandos com variáveis inputs
	return output1, output 2 #Um ou mais outputs
end
```
- Construir funções é melhor e mais útil para reprodutibilidade.
- Facilita debugging
"""

# ╔═╡ 9c90333c-4134-4e86-8d10-d41bff035ab7
function calcula_raiz(n)
	for m in 1:n
		if m^2 == n
			return  m, m, :TemRaiz
		end
		if m^2 > n
			return  m-1, m, :NaoTemRaiz
		end
	end
end

# ╔═╡ f60cdba6-955c-4ef0-8c49-590257893a2e
n = 15

# ╔═╡ 76fa5da5-fefc-4f56-a14c-cfc645b8b7b7
calcula_raiz(n)

# ╔═╡ a0e060e5-b2f8-401e-a78c-25d6c15df23d
sqrt(n)

# ╔═╡ f25056db-7961-4ffb-91d3-5a7bdba3b85a
md"""
- Uso do type `Symbol` em Julia
"""

# ╔═╡ 2c17e973-e8e6-496d-a7fd-c484cf0e4238
ronaldo = :TemRaiz

# ╔═╡ adec5130-12a1-4740-823b-b3bcb2e2f28f
ronaldo == :NaoTemRaiz

# ╔═╡ a2baf3cc-ac0d-4015-86bd-b8b49d99ba73
md"""
### Depurando a solução

- Como fazer para encontrar uma solução melhor?
"""

# ╔═╡ 958db75b-7b10-497e-8e7b-4882ba4eacd9
md"""
- Construindo intervalos com `range`
"""

# ╔═╡ 68466a9f-0882-4621-88b8-7865dabadf81
r = range(3, 4, length = 11) #Range => Intervalo

# ╔═╡ c1902ac1-b5d3-4d8f-8599-b070dea93d81
md"""
 - O comando `collect` transforma um `range` em um vetor (`Array`)
"""

# ╔═╡ 943230db-5f99-464a-b76c-480baee40753
vet_r = collect(r)

# ╔═╡ 24c9fe9e-1e53-4689-8468-c6dbf2de2a5c
vet_r[9]

# ╔═╡ ca7b4bea-9f94-4185-949f-6cb39b242579
collect(range(1,n,step =1))

# ╔═╡ b8b08634-db6e-4f31-a36f-ea5eddcc1d05
with_terminal() do
	# a, b, status = calcula_raiz(n)
	num_ele = length(vet_r)
	for index in 1:num_ele
		m = vet_r[index]
		if m^2 == n
			@show  m, m, :TemRaiz
			break
		end
		if m^2 > n
			@show  vet_r[index-1], m, :NaoTemRaiz
			break
		end
	end
end

# ╔═╡ ca61832f-acef-45b8-9548-dfcfda22fbb6
md"""
#### Tarefa Semana 1

> Implementar em Julia os seguintes algorimtos para encontrar raiz quadrada de um número inteiro $${n >0}$$. 
>  1. Com 1 casa de precisão depois da vírgula
>  2. Com $$t\in\mathbb{Z}$$ casas de precisão depois da vírgula

**Observações:** 
- Suba o Notebook Pluto com nome _Tarefa1_Meu_Nome.pluto.jl_ na Tarefa 1 específica no Julia

- Não esqueça de incluir as *Referências* consultadas, incluindo pessoas.

- Você abrir diretamente no Pluto a tarefa usando o seguinte [link](https://github.com/lrsantos11/metodos-numericos/raw/2021-1/tarefas/tarefa_semana1.jl)
"""

# ╔═╡ Cell order:
# ╟─e45bbc21-b1dd-492e-8550-22b080a5ad9a
# ╠═51f9e287-17b4-4949-8ece-b081d2ae8cf3
# ╠═2b049859-05a8-4c03-985f-a048ad3403c8
# ╠═993ffa94-cefe-11eb-218c-e1a48fc361a8
# ╠═fcee9fab-488c-49b3-add5-39fc7b095e95
# ╠═ce5b18af-a1e0-4fb0-b6a0-757869765d37
# ╠═0a0dd88f-ae9e-4b21-9931-da6178d5324b
# ╠═92a2f02e-f83b-4f3e-8af3-7de014a76864
# ╠═e607addd-9e0a-4037-b9f2-fedf8912de81
# ╠═27114178-876e-4458-9d37-5f11c8625846
# ╠═6994acf6-9aa3-4177-8b20-f40affbbb02e
# ╠═afb15742-9fa7-4de6-b0a4-51fed78c181f
# ╠═ee9edf86-f035-44b0-9e4b-1bc34ab7a1b0
# ╠═9590b96e-0d3c-47bd-a238-a0d72dfbdb8d
# ╟─b04f4fc2-ebde-4901-aa9f-0315f379b715
# ╠═6d0293c3-a67d-4ed1-8dbf-4b549282af2e
# ╠═ab9dea6e-0ee2-4424-8e9b-6b5832329e5a
# ╟─12d93f85-309c-4b4a-8e8b-28bd5ec4381b
# ╠═169f6fe6-9420-4460-aa51-df4c7f6cce63
# ╠═79afca88-d86b-45be-993d-2a7bea872982
# ╟─600ee512-b3c0-4b62-8bbc-4fde624325f2
# ╠═4e192825-1212-48bb-bdff-b575fe3997a2
# ╠═d048bcf5-221f-4df7-8e7c-1383e398d6a0
# ╠═44ea2c67-9e6a-4b93-894f-2a3b66d6a42a
# ╟─05461694-b4c4-4a2e-8f9f-01574dca4919
# ╠═2dd983c1-288d-48b5-b12f-1ac281b5e6ad
# ╟─9bfd6085-389b-4f81-897c-2c8591977fd1
# ╠═9c90333c-4134-4e86-8d10-d41bff035ab7
# ╠═f60cdba6-955c-4ef0-8c49-590257893a2e
# ╠═76fa5da5-fefc-4f56-a14c-cfc645b8b7b7
# ╠═a0e060e5-b2f8-401e-a78c-25d6c15df23d
# ╟─f25056db-7961-4ffb-91d3-5a7bdba3b85a
# ╠═2c17e973-e8e6-496d-a7fd-c484cf0e4238
# ╠═adec5130-12a1-4740-823b-b3bcb2e2f28f
# ╟─a2baf3cc-ac0d-4015-86bd-b8b49d99ba73
# ╟─958db75b-7b10-497e-8e7b-4882ba4eacd9
# ╠═68466a9f-0882-4621-88b8-7865dabadf81
# ╟─c1902ac1-b5d3-4d8f-8599-b070dea93d81
# ╠═943230db-5f99-464a-b76c-480baee40753
# ╠═24c9fe9e-1e53-4689-8468-c6dbf2de2a5c
# ╠═ca7b4bea-9f94-4185-949f-6cb39b242579
# ╠═b8b08634-db6e-4f31-a36f-ea5eddcc1d05
# ╟─ca61832f-acef-45b8-9548-dfcfda22fbb6
