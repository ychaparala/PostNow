from craigslist import CraigslistHousing, CraigslistForSale
import json


cl = CraigslistHousing(site='dallas', category='apa',filters={'max_price': 2000,'min_price': 1000})

cs= CraigslistForSale(site='dallas', category='cta')

results = cl.get_results(sort_by='newest', geotagged=True, limit=40)

resultsCS = cs.get_results(sort_by='newest', geotagged=True, limit=40)

for result in results:
    print(result) 
    
for result in resultsCS:
    print(result)
