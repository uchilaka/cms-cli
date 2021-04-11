require 'minitest/autorun'

module CmsCli
  # describe ServiceResult do
  #   describe '#messages' do
  #
  #   end
  #
  #   describe '#errors' do
  #
  #   end
  # end

  describe ServiceResult, :append_messages do
    before do
      @described_class = ServiceResult
    end

    def subject
      @described_class.new
    end

    it 'handles no prior messages' do
      subject.send(:append_messages, 'a message', 'b message')
      _(messages.count).must_equal(2)
    end
  end
end
