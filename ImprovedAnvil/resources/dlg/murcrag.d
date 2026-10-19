EXTEND_BOTTOM ~MURCRAG~ 0
  IF ~Global("Iapennyroyal","GLOBAL",1)~ THEN REPLY @10145 GOTO 56
END

APPEND ~MURCRAG~
  IF ~~ THEN BEGIN 56
    SAY @10146
    IF ~~ THEN REPLY #57002 GOTO 1
    IF ~PartyGoldGT(999)~ THEN REPLY #33410 DO ~GiveItemCreate("S!misc58",[PC],1,0,0)~ GOTO 57
  END

  IF ~~ THEN BEGIN 57
    SAY #30884
    IF ~~ THEN DO ~SetGlobal("Iapennyroyal","GLOBAL",2)~ EXIT
  END
END