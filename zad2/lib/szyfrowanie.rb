def rot13(tekst)
  zakodowane = %w()
  tekst.each_char do |char|
    if (char >= 'a' && char <= 'm') || (char >= 'A' && char <= 'M')
      kodowanie = char.ord + 13
    elsif (char >= 'n' && char <= 'z') || (char >= 'N' && char <= 'Z')
      kodowanie = char.ord - 13
    elsif char == ' '
      kodowanie = ' '
    end
    zakodowane.push(kodowanie.chr)
  end
  return zakodowane.join
end

def binarny(tekst)
  zakodowane = []
  tekst.each_char do |char|
    if char == ' '
      zakodowane.push('0100000')
    elsif char != ' '
      zakodowane.push(char.ord.to_s(2))
    end
  end
  return zakodowane.join
end

def rotbin(tekst)
  zakodowane = rot13(tekst)
  return binarny(zakodowane)
end

def oRot13(zakodowane)
  odkodowane = rot13(zakodowane)
  return odkodowane
end

def oBinarny(zakodowane)
  a = zakodowane.length / 7
  odkodowane = []
  i=0
  j=0
  while (i < a)
    odkodowane.push(zakodowane[j..j+6].to_i(2).chr)
    i += 1
    j += 7
  end
  return odkodowane.join
end

def oRotbin(zakodowane)
  a = oBinarny(zakodowane)
  odkodowane = oRot13(a)
  return odkodowane
end
