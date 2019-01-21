#fp = 要保存的txt路径
# f =要修改的txt文本路径
fp = open('E:\\Multiple Segmentation Experiment\\Data\\SourceCode\\ucm500.txt','w+') 
with open('E:\\ucm500.txt','r+') as f: 
	for line in f.readlines():
		line1=line.replace('E:\\Multiple Segmentation Experiment\\Data\\SourceCode\\src\\','')
		line2=line1.replace('.jpg','')
		line3=line2.strip()
		fp.write(line3+'\n')
	f.close()
fp.close()