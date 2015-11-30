#encoding: utf-8

class KissShot::Spec
  attr_accessor :metadata, :content, :indent

  def initialize(metadata = {})
    self.metadata = metadata
    self.indent   = 0
    self.content  = ""
  end

  def use(mod)
    self.extend mod
  end

  def indent_up
    self.indent += 2
  end

  def indent_down
    self.indent -= 2 unless self.indent < 2
  end

  def raw(input = "")
    self.content += input
  end

  def line(input = "")
    if input.length > 0
      raw " " * self.indent
      raw input
    end
    raw "\n"
  end
end
