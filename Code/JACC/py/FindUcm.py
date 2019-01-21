#根据*.txt找ucm结果图
"""
将filePath文件下的图片保存在newFilePath文件夹下的相应子文件夹中
pic 是存放每个图片要移到的子文件夹名
""" 
import os, sys 
from PIL  import Image 
def moveImg(filePath, newFilePath, txt): 
	imgtxt = open(txt,'r')
	for num in imgtxt:
		line = num.strip()
		pic =line.strip()+"_ucm.bmp" 
		fl = filePath + '\\' + pic
		img = Image.open(fl) 
		img.save(newFilePath + '\\' + pic) 
	imgtxt.close()
filePath = "E:\\Multiple Segmentation Experiment\\Data\\VOC2012\\UCMImages"
newFilePath ="E:\\Multiple Segmentation Experiment\\Data\\SourceCode\\UcmIamges"
txt ="E:\\Multiple Segmentation Experiment\\Data\\SourceCode\\voc50.txt"
moveImg(filePath, newFilePath, txt)
