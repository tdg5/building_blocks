require 'builder_dsl/version'
require 'builder_dsl/builders/builder_builder'

module BuilderDSL
  DEFAULT_DEFINITION_BUILDER = BuilderDSL::Builders::BuilderBuilder

  def self.default_definition_builder
    return @default_definition_builder || DEFAULT_DEFINITION_BUILDER
  end

  def self.default_definition_builder=(klass)
    @default_definition_builder = klass
  end

  def self.define(definition_builder = self.default_definition_builder, *args)
    block_given? ? definition_builder.build(*args, &Proc.new) : definition_builder.build(*args)
  end
end
