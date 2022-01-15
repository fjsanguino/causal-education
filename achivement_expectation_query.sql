-- This query was the one used for obtaining the table for the first experiment,
-- where the expectations were linked to the grades of the student.
-- The output table was directly imputted to the causal algorithm

select t_exp_1.ID_t,
       exp_1,
       ach_german_1,
       ach_maths_1,
       exp_2,
       ach_german_2,
       ach_maths_2,
       exp_3,
       ach_german_3,
       ach_maths_3,
       exp_4,
       ach_german_4,
       ach_maths_4
from (select ID_t, t31135a as exp_1 from ptarget where wave = 1 and t31135a not in (-54, -90, -95)) as t_exp_1,
     (select ID_t, t31135a as exp_2 from ptarget where wave = 2 and t31135a not in (-54, -90, -95)) as t_exp_2,
     (select ID_t, t31135a as exp_3 from ptarget where wave = 3 and t31135a not in (-54, -90, -95)) as t_exp_3,
     (select ID_t, t31135c as exp_4 from ptarget where wave = 4 and t31135c not in (-54, -90, -95)) as t_exp_4,
     (select ID_t, t724101 as ach_german_1
      from ptarget
      where wave = 2
        and t724101 not in (-20, -54, -90, -95, -97)
        and t724101 is not null) as t_ach_german_1,
     (select ID_t, t724102 as ach_maths_1
      from ptarget
      where wave = 2
        and t724102 not in (-20, -54, -90, -95, -97)
        and t724102 is not null) as t_ach_maths_1,
     (select ID_t, t724101 as ach_german_2
      from ptarget
      where wave = 3
        and t724101 not in (-20, -54, -90, -95, -97)
        and t724101 is not null) as t_ach_german_2,
     (select ID_t, t724102 as ach_maths_2
      from ptarget
      where wave = 3
        and t724102 not in (-20, -54, -90, -95, -97)
        and t724102 is not null) as t_ach_maths_2,
     (select ID_t, t724101 as ach_german_3
      from ptarget
      where wave = 4
        and t724101 not in (-20, -54, -90, -95, -97)
        and t724101 is not null) as t_ach_german_3,
     (select ID_t, t724102 as ach_maths_3
      from ptarget
      where wave = 4
        and t724102 not in (-20, -54, -90, -95, -97)
        and t724102 is not null) as t_ach_maths_3,
     (select ID_t, t724101 as ach_german_4
      from ptarget
      where wave = 5
        and t724101 not in (-20, -54, -90, -95, -97)
        and t724101 is not null) as t_ach_german_4,
     (select ID_t, t724102 as ach_maths_4
      from ptarget
      where wave = 5
        and t724102 not in (-20, -54, -90, -95, -97)
        and t724102 is not null) as t_ach_maths_4
where t_exp_1.ID_t = t_exp_2.ID_t
  and t_exp_1.ID_t = t_exp_3.ID_t
  and t_exp_1.ID_t = t_exp_4.ID_t
  and t_exp_1.ID_t = t_ach_german_1.ID_t
  and t_exp_1.ID_t = t_ach_maths_1.ID_t
  and t_exp_1.ID_t = t_ach_german_2.ID_t
  and t_exp_1.ID_t = t_ach_maths_2.ID_t
  and t_exp_1.ID_t = t_ach_german_3.ID_t
  and t_exp_1.ID_t = t_ach_maths_3.ID_t
  and t_exp_1.ID_t = t_ach_german_4.ID_t
  and t_exp_1.ID_t = t_ach_maths_4.ID_t
  and t_exp_1.ID_t in (select ID_t
                       from cohortprofile
                       where tx80106 not in (2, 7)
)
