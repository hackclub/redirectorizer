# redirectorizer

I decide who does what and where they do it at. What am I gonna run around like some proxy server somewhere for someone else's money?

(c.f. https://hack.af/gh/proxyparty, ye will be missed.)

## adding domains

Edit `rules.rb`, you'll be able to figure it out. You've always been a smart one!

Then, through OctoDNS or however the domain is managed, point it at a server running this (currently `a.selfhosted.hackclub.com`).

Finally, `ruby domains.rb --coolify` & paste that into the Coolify project so Traefik routes to it and provisions SSL certs.

## scripts

- `ruby generate.rb` - spits out the nginx.conf
- `ruby domains.rb` - lists all domains
- `ruby domains.rb --coolify` - lists all domains formatted for coolify (no wildcards)