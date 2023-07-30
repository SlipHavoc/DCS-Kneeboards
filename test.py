if __name__ == '__main__':
	try:
		test()
except BaseException:
	import sys
	print(sys.exc_info()[0])
	import traceback
	print(traceback.format_exc())
finally:
	print("Press Enter to continue ...")
	input()
	
	
def test():
	print('hello world')