require "administrate/base_dashboard"

class PlayerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    account: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    name_alias: Field::String,
    position: Field::String,
    number: Field::Number,
    birth_date: Field::String,
    height: Field::String,
    weight: Field::String,
    hometown: Field::String,
    former_team: Field::String,
    twitter_account: Field::String,
    instagram_account: Field::String,
    blog_url: Field::String,
    blog_rss_url: Field::String,
    chant: Field::String,
    status: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :position,
    :number,
    :height,
    :weight,
    :hometown,
    :status,
    :twitter_account,
    :blog_url,
    :account,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :account,
    :id,
    :name,
    :name_alias,
    :position,
    :number,
    :birth_date,
    :height,
    :weight,
    :hometown,
    :former_team,
    :twitter_account,
    :instagram_account,
    :blog_url,
    :blog_rss_url,
    :chant,
    :status,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :account,
    :name,
    :name_alias,
    :position,
    :number,
    :birth_date,
    :height,
    :weight,
    :hometown,
    :former_team,
    :twitter_account,
    :instagram_account,
    :blog_url,
    :blog_rss_url,
    :chant,
    :status,
  ].freeze

  # Overwrite this method to customize how players are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(player)
  #   "Player ##{player.id}"
  # end
end
