require "spec_helper"
require "fileutils"
require "hogger/cli/create"

describe Hogger::CLI::Create do
  let(:root_path) { "tmp" }

  before do
    FileUtils.rm_r root_path if Dir.exist? root_path
    Dir.mkdir root_path
    subject.root_path = root_path
  end

  subject { Hogger::CLI::Create.new "HoggerApp" }

  describe "#initialize" do
    it "sets the app_name" do
      subject.app_name.should eq subject.app_name
    end
  end

  describe "#create_app_folder" do
    it "creates the app folder" do
      subject.create_app_folder
      Dir.exist?(File.join(root_path, subject.app_name)).should be_true
    end
  end

  describe "#create_app_folder_structure" do
    it "creates the folder structure" do
      subject.create_app_folder
      subject.create_app_folder_structure
      Hogger::CLI::Create::FOLDERS.each do |f|
        Dir.exist?(File.join(root_path, subject.app_name, f)).should be_true
      end
    end
  end

  describe "#create_files" do
    it "creates the files" do
      subject.create_app_folder_structure
      subject.create_files
      Hogger::CLI::Create::FILES.each do |f|
        File.exist?(File.join(subject.root_path, subject.app_name, f)).should be_true
      end
    end
  end
end
