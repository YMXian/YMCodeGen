#encoding: utf-8

# This is the main class for code generation
#
class KissShot::Spec

  # @return [Hash] metadata
  attr_accessor :metadata
  # @return [String] content
  attr_accessor :content
  # @return [String] line prefix, such as indent, comment etc.
  attr_accessor :line_prefix

  # Create a instance of anonymous subclass, and eval instance
  # @param metadata [Hash] metadata
  # @param script [String] script to run
  # @param block [Block] block to invoke
  def self.run(metadata = {}, script = nil, &block)
    spec = Class.new(self).new(metadata)
    spec.instance_eval(script) unless script.nil?
    spec.instance_eval(&block) unless block.nil?
    spec.content
  end

  # Create a new Spec
  #
  # @param metadata [Hash] metadata
  # @return [KissShot::Spec] instance
  def initialize(metadata = {})
    self.metadata = metadata
    self.content  = ""
    self.line_prefix = ""
  end

  # Use a module, alias for `Class#extend`
  #
  # @param mod [Module] module to extend
  # @return [KissShot::Spec] self
  def use(mod)
    self.extend mod
    self
  end

  # Push line prefix
  #
  # @param prefix [String] line prefix to push
  # @return self
  def push_line_prefix(prefix)
    self.line_prefix += prefix
    self
  end

  # Pop line prefix
  #
  # @param prefix [String] line prefix to pop
  # @return self
  def pop_line_prefix(prefix)
    if self.line_prefix.end_with? prefix
      self.line_prefix = self.line_prefix[0, self.line_prefix.length - prefix.length]
    end
    self
  end

  # Indent right 2 whitespaces
  #
  # @return [KissShot::Spec] self
  def indent_up
    push_line_prefix "  "
  end

  # Indent left 2 whitespaces
  #
  # @return [KissShot::Spec] self
  def indent_down
    pop_line_prefix "  "
  end

  # Append raw string to content
  #
  # @param input [String] content to append
  # @param use_line_prefix [true, false] whether prepend indent
  # @return [KissShot::Spec] self
  def raw(input = "", use_line_prefix = false)
    return unless input.length > 0
    self.content += self.line_prefix if use_line_prefix
    self.content += input.to_s
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
