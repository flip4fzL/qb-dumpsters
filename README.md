# qb-dumpsters
This is not my work this is just a re-work of the qb-dumpsters script made my PhantomDK. 
All I did was change out the progress bars for mobius rprogress bars, add the eye commands and clean up unnecessary coding and I'm sure it could be improved even more.

You will need to download the following dependancies
RPROGRESS Bars
https://github.com/Mobius1/rprogress

QB-TARGET
https://github.com/BerkieBb/qb-target

Add this to your qb-target/config.lua
```
    ["Dumpsters"] = {
        models = {
            "prop_snow_dumpster_01",
            "prop_dumpster_4a",
            "prop_cs_dumpster_01a",
            "p_dumpster_t",
            "prop_dumpster_3a",
            "prop_dumpster_4b",
            "prop_dumpster_01a",
            "prop_dumpster_02b",
            "prop_dumpster_02a",
        },
        options = {
            {
                type = "client",
                event = "qb-dumpster:client:eye",
                icon = "fas fa-dumpster",
                label = "SEARCH DUMPSTER",
            },
        },
        distance = 4.0
    },
```
