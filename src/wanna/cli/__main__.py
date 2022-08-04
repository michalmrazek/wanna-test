import typer

app = typer.Typer()

import pkg_resources
my_version = pkg_resources.get_distribution('wanna-ml-test').version


@app.callback()
def callback():
    """
    Awesome Portal Gun
    """


@app.command()
def version():
    """
    Shoot the portal gun
    """
    typer.echo(f"Current version is {my_version}")


@app.command()
def load():
    """
    Load the portal gun
    """
    typer.echo("Loading portal gun")
