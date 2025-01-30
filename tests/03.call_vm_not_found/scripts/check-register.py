from opensips.mi import OpenSIPSMI, OpenSIPSMIException
import sys
import os

conn = os.getenv('CONN', 'http')
url = os.getenv('URL', 'http://localhost:8888/mi')
handler = OpenSIPSMI(conn=conn, url=url)

if len(sys.argv) < 2:
    print("FAILED: Usage: check-register.py <username>")
    sys.exit(1)

username = sys.argv[1]

out = handler.execute('ul_dump')
l = len(out['Domains'][0]['AORs'])

found = False

for i in range(l):
    if out['Domains'][0]['AORs'][i]['AOR'].startswith(username):
        found = True
        break

if found:
    print("FAILED: User %s found" % username)
    sys.exit(1)

print("SUCCESS: User %s not found" % username)
sys.exit(0)
