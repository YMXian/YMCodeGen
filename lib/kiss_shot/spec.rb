#encoding: utf-8

# This is the main class for code generation
#
class KissShot::Spec

  # @return [Hash] metadata
  attr_accessor :metadata
  # @return [String] content
  attr_accessor :content
  # @return [Fixnum] current indent
  attr_accessor :indent

  # Create a new Spec
  #
  # @param metadata [Hash] metadata
  # @return [KissShot::Spec] instance
  def initialize(metadata = {})
    self.metadata = metadata
    self.indent   = 0
    self.content  = ""
  end

  # Use a module, alias for `Class#extend`
  #
  # @param mod [Module] module to extend
  # @return [KissShot::Spec] self
  def use(mod)
    self.extend mod
    self
  end

  # Indent right 2 whitespaces
  #
  # @return [KissShot::Spec] self
  def indent_up
    self.indent += 2
    self
  end

  # Indent left 2 whitespaces
  #
  # @return [KissShot::Spec] self
  def indent_down
    self.indent -= 2 unless self.indent < 2
    self
  end

  # Append raw string to content
  #
  # @param input [String] content to append
  # @param prepend_indent [true, false] whether prepend indent
  # @return [KissShot::Spec] self
  def raw(input = "", prepend_indent = false)
    return unless input.length > 0
    self.content += " " * indent if prepend_indent
    self.content += input
    self
  end

  # Apend line to content, indent prepended
  #
  # @param input [String] content to append
  # @return [KissShot::Spec] self
  def line(input = "")
    raw input, true
    raw "\n"
  end
end
