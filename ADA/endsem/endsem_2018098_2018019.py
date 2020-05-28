import time
def graph_generate(input_file:list,n:int):
	check =True
	global graph
	graph={}
	for i in range(1,n+1):
		for j in range(n):
			if(input_file[i][j]=='1'):
				u = (i-1)*n +j+1
				if check:
					global first_inst
					first_inst = u
					check=False
				if u not in graph.keys():
					graph[u] = []
				if(i!=1 and input_file[i-1][j]=='1'):
					v = ((i-1)*n +j+1)-n
					graph[u].append(v)
				if(j!=0 and input_file[i][j-1]=='1'):
					v = ((i-1)*n +j+1)-1
					graph[u].append(v)
				if(i!=n and input_file[i+1][j]=='1'):
					v = ((i-1)*n +j+1)+n
					graph[u].append(v)
				if(j!=n-1 and input_file[i][j+1]=='1'):
					v = ((i-1)*n +j+1)+1
					graph[u].append(v)
	return bipartite(graph)

def bipartite(graph:dict):
	color = {}
	count_b = 0
	count_r = 0
	tempr =0
	tempb = 0
	visited = {}
	if(len(graph)==0):
		return False
	for key in graph.keys():
		color[key] = 'W'
		visited[key] = False
	src = first_inst
	color[src] = 'R'
	count_r+=1
	tempr+=1
	queue = []
	queue.append(src)
	visited[src]=True

	while(len(queue)!=0):
		u = queue.pop(0)
		if color[u]=='W':
			color[u]='R'
			count_r+=1
			tempr+=1
		visited[u]=True
		for edge in graph[u]:
			if visited[edge]:
				if color[edge]==color[u]:
					return False
			elif color[edge]=='W':
				if(color[u]=='R'):
					color[edge]='B'
					count_b+=1
					tempb+=1
				else:
					color[edge]='R'
					count_r+=1
					tempr+=1
				queue.append(edge)
				visited[edge]=True

		if(len(queue)==0):
			if(tempr!=tempb):
				return False
			tempr = 0
			tempb = 0
			for key in graph.keys():
				if(visited[key]==False):
					queue.append(key)
					break
	if(count_r==count_b):
		return True
	else:
		return False

def match(graph:dict):
	matched_pair = []
	matchcheck =True
	edge_count = {}
	for key in graph.keys():
		edge_count[key]=len(graph[key])
	while(len(graph)!=0):
		temp = min(edge_count.values())
		for key in edge_count.keys():
			if edge_count[key]==temp:
				edge_countx = key
				break 
		part1 = edge_countx
		try:
			part2 = graph[part1][0]
		except:
			matchcheck = False
			return matched_pair,matchcheck
		for edges in graph[part1]:
			graph[edges].remove(part1)
			edge_count[edges]-=1
		for edges in graph[part2]:
			graph[edges].remove(part2)
			edge_count[edges]-=1
		del graph[part1]
		del graph[part2]
		del edge_count[part1]
		del edge_count[part2]
		matched_pair.append((part1,part2))
	return matched_pair,matchcheck

with open('input.txt','r') as file:
	input_file = file.readlines()
n = int(input_file[0][:-1])

check = graph_generate(input_file,n)

if(check):
	pair,matchcheck = match(graph)
	if matchcheck:
		with open('output.txt','w') as file:
			file.write('1\n')
			for val in pair:
				cord1i = val[0]//n +1
				cord1j = val[0]%n
				if cord1j==0:
					cord1j=n
					cord1i-=1
				cord1 = '('+ str(cord1i) +','+ str(cord1j) +')'
				cord2i = val[1]//n +1
				cord2j = val[1]%n
				if cord2j==0:
					cord2j=n
					cord2i-=1
				cord2 = '('+ str(cord2i) +','+ str(cord2j) +')'
				file.write(cord1+cord2+'\n')
			file.close()
	else:
		with open('output.txt','w') as file:
			file.write('0\n')
			file.close()
else:
	if len(graph)==0:
		with open('output.txt','w') as file:
			file.write('1\n')
			file.close()
	else:
		with open('output.txt','w') as file:
			file.write('0\n')
			file.close()
