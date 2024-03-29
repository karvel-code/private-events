# frozen_string_literal: true

class AddTitleAndDescriptionToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :title, :string
    add_column :events, :description, :text
  end
end
