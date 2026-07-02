config do
  extra_headers("X-Clacks-Overhead" => "GNU Terry Pratchett") do
    # dino.icu
    redirect "dino.icu", to: "https://meta.dino.icu", code: 302

    # hackedu.us
    redirect "hackedu.us", to: "https://hackclub.com", code: 302
    redirect "donate.hackedu.us", to: "https://hackclub.com/donate", code: 302

    # hack.club
    redirect "flagship.hack.club", to: "https://flagship.hackclub.com"
    redirect "mail.hack.club", to: "https://mail.hackclub.com"

    # hackclub.com
    redirect "bin.hackclub.com", to: "https://hackclub.com/bin", code: 302, strip_args: true
    redirect "blog.hackclub.com", to: "https://hackclub.com", code: 302
    redirect "conduct.hackclub.com", to: "https://hackclub.com/conduct/", code: 302
    redirect "donate.hackclub.com", to: "https://hackclub.com/donate", code: 302
    redirect "find.hackclub.com", to: "https://finder.hackclub.com", code: 302
    redirect "gh.hackclub.com", to: "https://github.com/hackclub/hackclub", code: 302, strip_args: true
    redirect "high-seas.hackclub.com", to: "https://highseas.hackclub.com", code: 302
    redirect "jobs.hackclub.com", to: "https://hackclub.com/jobs"
    redirect "pizza.hackclub.com", to: "https://hackclub.com/pizza", code: 302
    redirect "sinerider.hackclub.com", to: "https://sinerider.com", code: 302
    redirect "liquidate.hackclub.com", to: "https://itch.io/jam/liquidate", code: 302

    # hackclub.id
    redirect "hackclub.id", to: "https://auth.hackclub.com"

    # hackclub.io
    redirect "hackclub.io", to: "https://hackclub.com", code: 302
    redirect "donate.hackclub.io", to: "https://hackclub.com/donate", code: 302

    # hackclub.money
    redirect "hackclub.money", to: "https://hcb.hackclub.com", code: 302

    # hackclub.org
    redirect "hackclub.org", to: "https://hackclub.com", code: 302
    redirect "*.hackclub.org", to: "https://hackclub.com", code: 302
    redirect "sprig.hackclub.org", to: "https://hack.af/sprig-for-hackers", code: 302

    # ~ enter proxy zone ~

    # bulckcah.com
    proxy "bulckcah.com", to: "https://hackclub.com"
    proxy "blot.bulckcah.com", to: "https://blot.hackclub.com"
    proxy "school-toolbox.bulckcah.com", to: "https://school-toolbox.hackclub.com"
    proxy "sprig.bulckcah.com", to: "https://sprig.hackclub.com"
    proxy "toolbox.bulckcah.com", to: "https://toolbox.hackclub.com"
    proxy "workshops.bulckcah.com", to: "https://workshops.hackclub.com"

    # hackclub.com
    proxy "design.hackclub.com", to: "https://hackclub.github.io/design-system"

    # scrapbook
    proxy "scrap.dev", to: "https://scrapbook.hackclub.com"
    proxy "scrapbook.dev", to: "https://scrapbook.hackclub.com"

    # wackclub.com
    proxy "blot.wackclub.com", to: "https://blot.hackclub.com"
    proxy "sprig.wackclub.com", to: "https://sprig.hackclub.com"
  end

  redirect "sprig.hack.af", to: "https://sprig.hackclub.com", code: 302
end
