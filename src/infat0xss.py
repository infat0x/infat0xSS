import signal
import sys
import os
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service
from selenium.common.exceptions import UnexpectedAlertPresentException
from rich.console import Console
from rich.prompt import Prompt
import time

console = Console()

geckodriver_path = os.path.join(os.path.dirname(__file__), "geckodriver")

if not os.path.exists(geckodriver_path):
    console.print(f"[red]Error: 'geckodriver' not found at {geckodriver_path}. Please place 'geckodriver' in the specified location and try again.[/red]")
    sys.exit(1)

options = Options()
options.add_argument('--headless')

service = Service(geckodriver_path)
driver = webdriver.Firefox(service=service, options=options)

console = Console()

def handle_sigint(_, __):
    console.print("\n[cyan]Exiting gracefully...[/cyan]")
    driver.quit()
    sys.exit(0)

signal.signal(signal.SIGINT, handle_sigint)

for i in range(2):
    console.print(":globe_with_meridians: [bold cyan]Enter the target URL:[/bold cyan]")
    url = Prompt.ask(":arrow_right: [bold green]URL[/bold green]")
    if url.startswith("http://") or url.startswith("https://"):
        break
    console.print("[red]Invalid URL. Please enter a valid URL starting with 'http://' or 'https://'.[/red]")
payloads_file = os.path.join(os.path.dirname(__file__), "..", "payloadDB", "xss.txt")

start_time = time.time()  

try:
    with open(payloads_file, 'r') as file:
        payloads = file.readlines()
    a = 0
    url_filename = url.replace("http://", "").replace("https://", "").replace("/", "_") + ".txt"
    detected_file_path = os.path.join(os.path.dirname(__file__), "..", "logs", url_filename)

    existing_logs = set()
    if os.path.exists(detected_file_path):
        with open(detected_file_path, "r") as detected_file:
            existing_logs = set(detected_file.readlines())

    for payload in payloads:
        a += 1
        payload = payload.strip()
        log_entry = f'{a}) 😈 Payload: {payload}'

        if any(log_entry in log for log in existing_logs):
            console.print(f"[yellow]{a}) 🔄 Payload: {payload} already logged, skipping.[/yellow]")
            continue

        try:
            driver.get(url + payload)
            try:
                WebDriverWait(driver, 0.5).until(EC.alert_is_present())
                alert = driver.switch_to.alert
                alert_message = alert.text
                with open(detected_file_path, "a") as detected_file:
                    detected_file.write(f'{log_entry}  ==>  Alert message: {alert_message} ✅\n\n ===> URL: [{url}{payload}]\n\n\n')
                console.print(f'[green]{log_entry}  ==>  Alert message: {alert_message} ✅[/green]')
                alert.accept()
            except Exception:
                console.print(f"[red]{a}) 🗑️  Payload: {payload} ❌[/red]")

        except UnexpectedAlertPresentException as e:
            pass
            start_time = time.time()

finally:
    driver.quit()
    end_time = time.time()
    elapsed_time = end_time - start_time
    hours, rem = divmod(elapsed_time, 3600)
    minutes, seconds = divmod(rem, 60)
    detected_count = 0
    if os.path.exists(detected_file_path):
        with open(detected_file_path, "r") as detected_file:
            detected_count = len(detected_file.readlines())

    console.print("\n[bold cyan]:sparkles: Scan Summary :sparkles:[/bold cyan]")
    console.print("[bold magenta]" + "=" * 40 + "[/bold magenta]")
    console.print(f":hourglass_flowing_sand: [green]Elapsed Time:[/green] [bold yellow]{int(hours):02}:{int(minutes):02}:{int(seconds):02}[/bold yellow]")
    console.print(f":dart: [green]Total Payloads Tested:[/green] [bold yellow]{a}[/bold yellow]")
    console.print(f":shield: [green]Total Payloads Detected From logs/:[/green] [bold yellow]{detected_count}[/bold yellow]")
    console.print("[bold magenta]" + "=" * 40 + "[/bold magenta]")

    
    console.print(r"""
[bold red]
  ██╗  ██╗███████╗███████╗
  ╚██╗██╔╝██╔════╝██╔════╝
   ╚███╔╝ ███████╗███████╗
   ██╔██╗ ╚════██║╚════██║
  ██╔╝ ██╗███████║███████║
  ╚═╝  ╚═╝╚══════╝╚══════╝
[/bold red]
    """)

