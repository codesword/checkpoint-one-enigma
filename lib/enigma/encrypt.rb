module Enigma
  class Encrypt
    def initialize
      enigma_key = EnigmaKey.new
      file_store = FileStore.new
      @engine = Engine.new(enigma_key, file_store)
    end

    def call(file_name, output_file_name)
      shift_strategy = Proc.new do |character_position, shift|
        character_position + shift
      end
      @engine.save_and_report file_name, output_file_name, &shift_strategy
    end
  end
end