--
-- Copyright 2014, General Dynamics C4 Systems
--
-- This software may be distributed and modified according to the terms of
-- the GNU General Public License version 2. Note that NO WARRANTY is provided.
-- See "LICENSE_GPLv2.txt" for details.
--
-- @TAG(GD_GPL)
--

#include <config.h>

base 64

-- Intel VT-d Root Table Entry
block vtd_rte {
    padding                         64
    field_high  ctp                 52
    padding                         11
    field       present             1
}

-- Intel VT-d Context Entry
block vtd_cte {
    padding                         40
    field       did                 16
    padding     4
    field       rmrr                1
    field       aw                  3
    field_high  asr                 52
    --- Assume ALH, EH as Reserved and FPD Enabled.
    padding                         8
    field       translation_type    2
    padding                         1
    field       present             1
}

-- Intel VT-d Page Table Entry
block vtd_pte {
    --- Assume AVAIL and TM as Reserved
    field_high  addr                52
    padding                         10
    field       write               1
    field       read                1
}
