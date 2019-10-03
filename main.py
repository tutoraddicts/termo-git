import subprocess
from kivy.app import App
from kivy.uix.gridlayout import Gridlayout

class GITUX(Gridlayout):
	def __init__(self, **kwargs):
		super(GITUX, self).__init__(**kwargs)
	sel.cols = 1
	intruction = "Enter the command you want to execute"
class MyApp(App):
	def bild(self):
		return GITUX()
if __name__ == "__main__":
	MyApp.run()
	
	
