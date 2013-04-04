require 'spec_helper'

describe Muggle::Assets::Middleware do
  let(:app) { mock(call: mock) }
  let(:env) { mock }
  let(:app_env) { Hash.new }

  subject { Muggle::Assets::Middleware.new(app) }

  before do
    Muggle::Assets.config.stub load_paths: ['load/path']
    Sprockets::Environment.should_receive(:new).and_return env
    env.should_receive(:append_path).with('load/path')
  end

  describe '#initialize' do
    it 'sets app' do
      expect(subject.app).to_not be_nil
    end

    it 'create an sprockets env' do
      expect(subject.environment).to eq env
    end
  end

  describe '#call' do
    context 'When request_path is "/assets"' do
      before do
        app_env['PATH_INFO'] = '/assets'
      end

      it 'should call the assets env' do
        env.should_receive(:call)
        subject.call(app_env)
      end
    end

    context 'When request_path is not "/assets"' do
      before do
        app_env['PATH_INFO'] = '/'
      end

      it 'should call the the app env' do
        app.should_receive(:call)
        subject.call(app_env)
      end
    end
  end
end
