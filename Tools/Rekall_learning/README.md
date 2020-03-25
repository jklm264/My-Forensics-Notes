* Rekall looks to be owned by Google, while Volatility is owned by Terremark, a Verizon company.
* One of the main differences between Rekall and other memory analysis frameworks is that Rekall uses symbols obtained from operating system vendors’ debugging information directly. 

# How to install rekall

1. virtualenv  /tmp/MyEnv
2. source /tmp/MyEnv/bin/activate
3. pip install --upgrade setuptools pip wheel #one part will fail, dw
4. pip install rekall-agent rekall
5. (Deactivate) to leave

Future dependency issue: `$sudo /tmp/MyEnv/bin/pip install future==0.16.0`

Src: <https://github.com/google/rekall/issues/448>

Resources:
<https://holdmybeersecurity.com/2017/07/29/rekall-memory-analysis-framework-for-windows-linux-and-mac-osx/>
<http://memory-analysis.rekall-forensic.com/www/02-What_is_memory/>

Rekall is built on top of Grr database. Grr is allows for IR to be done in fast, scalable manner to allow analysts to quickly triage attacks and perform analysis remotely. Grr's database is built as a YAML-typed git repo. See `Artifact Example.png` for example.

Src: <https://grr-doc.readthedocs.io/en/v3.2.1/what-is-grr.html>

Misc Src's: <https://github.com/ForensicArtifacts/artifacts/blob/master/docs/Artifacts%20definition%20format%20and%20style%20guide.asciidoc>
