require 'spec_helper'

describe DelegateAccessors do

  class DelegatorForm
    include DelegateAccessors

    def initialize(target)
      @target = target
    end
  end

  class OneAttribute < DelegatorForm
    delegate_accessors :name, to: :@target
  end

  class MultipleAttributes < DelegatorForm
    delegate_accessors :name, :body, to: :@target
  end

  let(:target) { double('DelegationTargert') }
  subject { subject_class.new(target) }

  context 'one attribute' do
    let(:subject_class) { OneAttribute }

    it "delegates one attribute" do
      expect(target).to receive(:name=)
      expect(target).to receive(:name)

      subject.name = "Awesome Article"
      subject.name
    end
  end

  context 'multiple attributes' do
    let(:subject_class) { MultipleAttributes }

    it "delegates one attribute" do
      expect(target).to receive(:name=)
      expect(target).to receive(:name)
      expect(target).to receive(:body=)
      expect(target).to receive(:body)

      subject.name = "Awesome Article"
      subject.name
      subject.body = "Body"
      subject.body
    end
  end
end

