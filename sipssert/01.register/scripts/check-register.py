from opensipscli import cli
import sys

handler = cli.OpenSIPSCLI()

if len(sys.argv) < 2:
    print("FAILED: Usage: check-register.py <username>")
    sys.exit(1)

username = sys.argv[1]

out = handler.mi("ul_dump")
l = len(out['Domains'][0]['AORs'])

found = False

for i in range(l):
    if out['Domains'][0]['AORs'][i]['AOR'].startswith(username):
        found = True
        break

if not found:
    print("FAILED: User %s not found" % username)
    sys.exit(1)

print("SUCCESS: User %s found" % username)
sys.exit(0)
