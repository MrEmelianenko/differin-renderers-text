require 'spec_helper'

describe Differin::Renderers::Text do
  it 'render as text' do
    diff = Differin::Diff.new('examples/file1.txt', 'examples/file2.txt')
    result = diff.process(renderer: Differin::Renderers::Text)

    expect(result).to include('Differin: ')
    expect(result).to include('<=>')
  end
end
