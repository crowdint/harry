require 'spec_helper'

describe Muggle::Assets::Configuration do
  describe '#initialize' do
    it 'initialize @load_paths with and empty array' do
      expect(subject.load_paths).to be_empty
    end
  end

  describe '@append_path' do
    it 'append a path to the load path' do
      expect{subject.append_path 'foo/path'}.to change{subject.load_paths}.
                                                    from([]).to(['foo/path'])
    end
  end
end
