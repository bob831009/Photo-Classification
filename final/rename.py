import os 
i=1
for file in os.listdir("./liang"): 
	if (file.endswith(".jpg")):
		print(file);
		os.rename("./liang/" + file, "./liang/Result/" + str(i) + ".jpg");
		i+=1;
	
