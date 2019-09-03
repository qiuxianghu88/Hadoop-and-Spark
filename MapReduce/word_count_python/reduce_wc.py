import sys
cur_word = None
sum = 0
for line in sys.stdin:
	SS = line.strip().split('\t')
	if len(ss) != 2:
		coutinue
	word, cnt = ss

	if cur_word == None:
		cur_word = word

	if cur_word != word:
		print '\t'.join([cur_word, str(sum)])
		cur_word = word
		sum = 0

	sum += int(cnt)
	
print '\t'.join([cur_word.strip(), str(sum)])