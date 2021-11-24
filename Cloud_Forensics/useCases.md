# Docker DFIR Use-Cases

An analyst may use Docker to easily transfer tools to be run in a lightweight capacity. 

For example, if I wanted to run Yara rules on a file but I do not have it installed, instead of taking time to install all the dependencies (plus accounting for troubleshooting time) I can just run `$docker run -it -v ./evidence:malware:ro \ -v ./rules:rules:ro blacktop/yara <file>`.

## Other DFIR Use Cases

- Volatility: `$docker run --rm -it -v memdumps:/home/memdumps remnux/volatility bash`
- pescanner: `$docker run --rm -it -v files:/home/workdir remnux/pescanner pescanner <malicious.exe>`
- GRR: `$docker run -e EXTERNAL_HOSTNAME="localhost" -e ADMIN_PASSWORD="demo" -p 0.0.0.0:8000:8000 -p 0.0.0.0:8000:8000 grrdocker/grr`
- Log2Timeline: `$docker run --rm -v <box_to_timeline>:/home log2timeline/plaso log2timeline.py /home/<box>`

Source: <https://www.deepshankaryadav.net/digital-forensics-and-incident-response-dfir-using-docker/>