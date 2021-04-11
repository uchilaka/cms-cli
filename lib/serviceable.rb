module CmsCli
  module Serviceable
    # @Todo implement error handling in a way that handles a limited range of workflow exceptions
    #   predictably when something goes wrong
    def if_success
      return @status unless success?

      yield
    end

    def errors
      @errors ||= []
    end

    def messages
      @messages ||= []
    end

    def value
      @value ||= nil
    end

    def status
      @status ||= nil # :success, :fail, :complete, nil
    end

    def success?
      [:success, nil].include?(@status) || complete?
    end

    def complete!(val = true, *messages)
      self.value = val
      self.messages.push(**messages)
    end

    def fail!(*messages, errors: [])
      self.status = :fail
      append_messages(**messages)
      self.errors.push(**errors)
    end

    def complete?
      @status == :complete
    end

    def failed?
      !success?
    end

    def messages=(*messages)
      append_messages(**messages)
    end

    private

    def append_messages(*messages)
      self.messages.push(**messages)
    end

    def value=(new_value)
      @value = new_value
    end

    def status=(new_status)
      @status = new_status
    end

    def errors=(*errors)
      @errors = errors
    end
  end
end
