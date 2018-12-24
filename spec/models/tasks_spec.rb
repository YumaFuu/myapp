require 'rails_helper'

describe Home do
  describe create do
    it '新規タスクが追加されること' do
      task = Task.new(name: params[:name],description: params[:description],deadline: params[:deadline])
      expect(task.name).to eq params[:name]
    end
  end
end
