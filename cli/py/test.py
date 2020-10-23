import cli.app
# https://pythonhosted.org/pyCLI/#:~:text=The%20cli%20package%20is%20a,profiling%20to%20your%20CLI%20apps.
@cli.app.CommandLineApp
def ls(app):
    pass

ls.add_param("-l", "--long", help="list in long format", default=False, action="store_true")

if __name__ == "__main__":
    ls.run()
