#!/usr/bin/env python
import pandas as pd
import requests
from bs4 import BeautifulSoup as bs

# scrape and parse the playscript
resp = requests.get("http://shakespeare.mit.edu/romeo_juliet/full.html")
soup = bs(resp.content, "html.parser")
rows = soup.find_all("a")

# list the characters that says the "speech"
roles = [x.contents[0].contents[0] for x in rows if "speech" in str(x.get("name"))]

# list the line count of each "speech"
speeches = [x.get('name') for x in rows]
line = [x for x,y in enumerate(speeches) if "speech" in str(y)]
line += [len(speeches)]
line_m = line[:-1]
lines = [line[x] - line_m[x-1] - 1 for x in range(1,len(line))]

# sum up line count for each character and get the highest line count
df = pd.DataFrame(
    {"roles": roles,
    "lines":lines})
print(df.groupby(["roles"]).sum().sort_values(by = "lines", ascending = False).iloc[0])
