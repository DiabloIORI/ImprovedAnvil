// in the inn
ALTER_TRANS ~PPSAEM3~
  BEGIN 12 END
  BEGIN 2 END
BEGIN
  "TRIGGER" ~Global("IADradeel","GLOBAL",0)~
END

ALTER_TRANS ~PPSAEM3~
  BEGIN 10 14 15 17 END
  BEGIN 0 END
BEGIN
  "TRIGGER" ~Global("IADradeel","GLOBAL",0)~
END

// at the docks
ALTER_TRANS ~PPSAEM3~
  BEGIN 27 END
  BEGIN 1 END
BEGIN
  "TRIGGER" ~Global("IADradeel","GLOBAL",0) PartyHasItem("misc9g")~
END

// in the inn
EXTEND_BOTTOM ~PPSAEM3~ 10 #0
  IF ~Global("IADradeel","GLOBAL",1)~ THEN REPLY #45623 EXTERN ~IADRAD~ 0
END

EXTEND_BOTTOM ~PPSAEM3~ 12 #1
  IF ~Global("IADradeel","GLOBAL",1)~ THEN REPLY @5494 GOTO 174
END

EXTEND_BOTTOM ~PPSAEM3~ 14 #1
  IF ~Global("IADradeel","GLOBAL",1)~ THEN REPLY @5495 GOTO 174
END

EXTEND_BOTTOM ~PPSAEM3~ 15 #1
  IF ~Global("IADradeel","GLOBAL",1)~ THEN REPLY @5496 GOTO 174
END

EXTEND_BOTTOM ~PPSAEM3~ 17 #1
  IF ~Global("IADradeel","GLOBAL",1)~ THEN REPLY @5497 GOTO 174
END

// at the docks
EXTEND_BOTTOM ~PPSAEM3~ 27 #1
  IF ~Global("IADradeel","GLOBAL",2) PartyHasItem("misc9g")~ THEN REPLY #45757 GOTO 178
END

APPEND ~PPSAEM3~
  // at the inn
  IF ~~ THEN BEGIN 173
    SAY @5492
    IF ~~ THEN REPLY @5493 GOTO 11
  END

  IF ~~ THEN BEGIN 174
    SAY @5498
    IF ~~ THEN REPLY @5499 GOTO 175
  END

  IF ~~ THEN BEGIN 175
    SAY @5600
    IF ~~ THEN REPLY @5601 EXTERN ~IADRAD~ 1
  END

  IF ~~ THEN BEGIN 176
    SAY @5604
    IF ~~ THEN REPLY @5605 GOTO 177
  END

  IF ~~ THEN BEGIN 177
    SAY @5606
    IF ~~ THEN REPLY @5607 GOTO 18
  END

  // at the docks
  IF ~~ THEN BEGIN 178
    SAY @5610
    // opt out of travel
    IF ~~ THEN REPLY @5611 DO ~SetGlobal("IADradeel","GLOBAL",7) SetGlobal("IADruidPlot","GLOBAL",17)~ GOTO 179
    // opt in
    IF ~~ THEN REPLY @5614 DO ~SetGlobal("IADradeel","GLOBAL",3)~ GOTO 180
  END

  IF ~~ THEN BEGIN 179
    SAY @5612
    IF ~~ THEN REPLY @5613 DO ~ActionOverride("S!drad01",JumpToPoint([2260.2530])) TakePartyItem("misc9g") DestroyItem("misc9g") SetGlobal("GaveSaemTheHorn","LOCALS",1)~ GOTO 29
  END

  IF ~~ THEN BEGIN 180
    SAY @5615
    IF ~~ THEN EXTERN ~IADRAD~ 3
  END

  IF ~~ THEN BEGIN 181
    SAY @5617
    IF ~~ THEN REPLY @5618 GOTO 182
  END

  IF ~~ THEN BEGIN 182
    SAY @5619
    IF ~~ THEN REPLY @5613 DO ~ActionOverride("S!drad01",JumpToPoint([2260.2530])) TakePartyItem("misc9g") DestroyItem("misc9g") SetGlobal("GaveSaemTheHorn","LOCALS",1)~ GOTO 29
  END

  // on the island
  IF ~AreaCheck("S!0002") Global("IADruidIsland","GLOBAL",0)~ THEN BEGIN 83
    SAY @5620
    IF ~~ THEN REPLY @5621 GOTO 184
  END

  IF ~~ THEN BEGIN 184
    SAY @5622
    IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("S!druc04")~
    EXIT
  END

  // at the docks, preparing to leave the island
  IF ~AreaCheck("S!0002") Global("IADruidIsland","GLOBAL",6)~ THEN BEGIN 185
    SAY @5710
    IF ~~ THEN EXTERN ~IAGDRU02~ 27
  END

  IF ~~ THEN BEGIN 186
    SAY @5719
    IF ~~ THEN EXTERN ~IAGDRU02~ 31
  END

  // last talk before leaving the island
  IF ~AreaCheck("S!0002") Global("IADruidIsland","GLOBAL",7)~ THEN BEGIN 187
    SAY @5730
    IF ~~ THEN REPLY @5731 GOTO 188
  END

  IF ~~ THEN BEGIN 188
    SAY @5732
    IF ~~ THEN REPLY @5733 GOTO 189
  END

  IF ~~ THEN BEGIN 189
    SAY @5734
    IF ~~ THEN DO ~SetGlobal("IADruidPlot","GLOBAL",8)
                   StartCutSceneMode()
                   StartCutSceneEx("Cut41q",TRUE)
                   Wait(1)
                   DestroySelf()~
    EXIT
  END
END
