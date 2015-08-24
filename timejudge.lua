timeTable = {
{--1_
  {
    good = 0,
    average = 0,
    bad = 0
  },--1_1
  {
    dev = 14.72,
    good = 20,
    average = 27
  }--1_2
} ,
{--2_
  {
    good = 0,
    average = 0,
    bad = 0
  },--2_1
  {
    dev = 21.14,
    good = 28,
    average = 35
  }--2_2
},
{--3_
  {

    good = 0,
    average = 0,
    bad = 0
  },--3_1
  {
    dev = 19.46,
    good = 24,
    average = 40
  }--3_2
}
}

function checkTime(achievedTime, levelString)
    local compTime = tonumber(achievedTime)
    local ExplodeParts = explode("_", levelString)
    local timejudgeTablePart = timeTable[tonumber(ExplodeParts[1])][tonumber(ExplodeParts[2])]
    if compTime < timejudgeTablePart.dev then
      return "Unbelievable!"
    end
    if compTime <= timejudgeTablePart.good then
      return "Very good!"
    end
    if compTime <= timejudgeTablePart.average then
      return "Pretty ok!"
    end
    if compTime >= timejudgeTablePart.average then
      return "Improvable!"
    end
    return ""
end
