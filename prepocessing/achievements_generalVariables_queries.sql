-- Queries for the courses table, creates a temporal table for improving the performance
drop table if exists base
create temporary table base as (
    select cohortprofile.ID_t as ID_t, cohortprofile.wave as wave, ID_cc, ID_cg, ID_cm,t31135a,t31135c,t724101,t724102,td0032a,td0032b,td0032c,td0033a,td0033b,td0033c,td0033d,td0033e,td0034a,td0034b,td0034c,td0035a,td0035b,td0035c,td0036a,td0036b,td0036c
    from cohortprofile, ptarget
     where cohortprofile.ID_cm <> -55
       and cohortprofile.ID_cg <> -55
       and cohortprofile.ID_cc <> -55
       and cohortprofile.tx80106 not in (2, 7)
       and cohortprofile.ID_t = ptarget.ID_t
       and cohortprofile.wave = ptarget.wave
)

drop table if exists base2
create temporary table base2 as (
select ID_t, base.wave as wave , base.ID_cc, pcourseclass.ID_e as ID_e, base.ID_cg, pcoursegerman.ID_e as pcoursegerman_id_e, base.ID_cm, pcoursemath.ID_e as pcoursemath_id_e, t31135a,t31135c,t724101,t724102,td0032a,td0032b,td0032c,td0033a,td0033b,td0033c,td0033d,td0033e,td0034a,td0034b,td0034c,td0035a,td0035b,td0035c,td0036a,td0036b,td0036c,e451010,e79201a_D,e79201c_D,e227400_D,e227400_g1D,e22740a,e22740b,e22740d,e22740e,e22740f,e22941a,e22941b,e22941c,e22941d,e22941e,e22941f,e22941g,e22941h,e22941i,e22940a,e22940b,e22940c,e22940d,ed0001h_D,ed0003h,ed0004a,ed0004b,ed0004c,ed0004d,ed0004e,ed0004f,ed0004g,ed0004h,ed0004i,ed0004j,ed0005a,ed0005b,ed0005c,ed0005d,ed0005e,ed0005f,ed0005i,ed0005j,ed0005k,ed0006a,ed0006b,ed0006c,ed0006d,ed0007a,ed0007b,ed0007c,ed0007d,ed0007e,ed0007f,ed0007g,ed0009a,ed0009b,ed0009d,ed0007h,ed0007i,ed0007j,ed0009e,ed0009f,ed0009c,ed0009g,ed0017a,ed0017b,ed0017c,ed0017d,ed0017e,ed0025h_D,ed00027,ed0028a,ed0028b,ed0028c,ed0028d,ed0028e,ed0028f,ed0028g,ed0028h,ed0028i,ed0028j,ed0029a,ed0029b,ed0029c,ed0029d,ed0030a,ed0030b,ed0030c,ed0030d,ed0031a,ed0031b,ed0031c,ed0031d,ed0031e,ed0031f,ed0031g,ed0033a,ed0033b,ed0033d,ed0033e,ed0033f,ed0033g
from base, pcourseclass, pcoursegerman, pcoursemath
where base.ID_cc = pcourseclass.ID_cc
       and base.wave = pcourseclass.wave
       and base.ID_cg = pcoursegerman.ID_cg
       and base.wave = pcoursegerman.wave
       and base.ID_cm = pcoursemath.ID_cm
       and base.wave = pcoursemath.wave
)

select * from base2


-- Queries for the student data
select ID_t, wave, t292301,t292302,t292303,t292306,t34006i,t27111s,t731312,t731314,t731362,t731353,t66800l,t66800m,t66800n,t66800o,t66800p,t66800q,t66800r,t66800s,t66800t,t66800u,t66800v,t521051,t66206a,t66206b,t66206c,t66206d,t66206e,t66206f,t66206g,t66206h,t66206i,t66206j,t66206k,t66206l,t66206m,t66206n,t66206o,t66206p,t66206q,t66206r,t10111a,t10111c,t10112a,t10112c,t10113a,t10113c,t10114a,t10114c,t10115a,t10115c,t327092,t327093,t327096,t327097,t31909d,t283621,t283622,t283623,t284624,t285627,t284625,t284626,t285628,t285629,td1001a,td1001c,td1001d,t281600,t28161a,t28161b,t28161d,td0002d,td0005b,td0006a,td0006b,td0006c,td0006d,td0006e,td0006f,t32000f,t30335d,t30335e,t30335f,t517200,t517201,t517202,t527004,t527017,t527019,t527021,t527028,t527029,t527032,t527034,t34006a,t34006b,t34006c,t34006g,t34006h,t66210p,t101000,t30535a,t30535b,t66004a,t66004b,t66004c,t66004d,t66004e,t66005a,t66005b,t66005c,t66005d,t66005e,t66201a,t66208a,t66201b,t66208b,t66201c,t66208c,t66201d,t66208d,t320403,t67001a,t67001b,t67000a,t67001c,t67001d,t67000b,t67000c,t67000d,t67000e,t67001e,tf00050,t66502a,t66502b,t66502c,t66502d,t66502e,t66502f,t66502g,t66502h,t66502i,t66502j,t66502l,t514003,t514004,t32304i,t32304j,t66402a,t66403a,t66404a,t66402b,t66403b,t66404b,t66402c,t66403c,t66404c,t66402d,t66403d,t66404d,t327031,t327032,t327033,t327034
from ptarget
where ID_t in (select ID_t
                       from cohortprofile
                       where tx80106 not in (2, 7))

-- Queries for the parent data
select ID_t, wave, p400090_g1D,p400070_g1D,p296402_g9,p66802e_g1,p66802d_g1,p66802c_g1,p66802b_g1,p66802a_g1,p400500_g1,p407050_g1D,p413000_g1D,p414000_g1D,p510002,p30300a,p412000,p281401,p31135a,p32903c,p32903a,p32903d,p32903b,p32830a,p320660,p512305,p512605,p41330b,p41330d,pb00040,p305350,p305600,p31135c,pb00020,pb00030,pd0300g,pd0500g,pd0600g,pd0100g,pd0200g,p261100,pd0200u,pd0300u,pd0400u,pd0100u,p327031,p66802a,pf00020,p514501,p34005a
from pparent
where ID_t in (select ID_t
                       from cohortprofile
                       where tx80106 not in (2, 7))

-- Queries for the educator data
select ID_e, wave, e229820_D,ed1008a,ed1008b,ed1008c,ed1008d,ed1008e,ed1011a,ed1011b,ed1011c,ed1011d,ed1011e,ed1011f,ed1011g,ed1011h,ed1011i,e22240a,e22240b,e22240c,e22240g,e22240h,e22240i,e22240m,e22240p,e536031,e536032,e536033,e536034,e536035,e536036,e536037,e536038,e536039,e536040,e537050,e537123,e537140,e400000,e42570a,e42570b,e42570i,e42570c,e42570k,e42570d,e42570f,e42570j,e42570g,e42570h,e762110,e22280a,e22280b,e22280c,e22280d,e22280e,e22280f,e22280g,e22280h,e22280i,e22280j,e22280k,e22540d,e22540e,e22540f,e22540h,e22540k
from peducator