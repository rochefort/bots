require "administrate/base_dashboard"

class AccountDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    account_rss_items: Field::HasMany,
    rss_items: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    note: Field::String,
    associate_tag: Field::String,
    status: Field::Number,
    keywords: Field::Text,
    consumer_key: Field::String,
    consumer_secret: Field::String,
    access_token: Field::String,
    access_token_secret: Field::String,
    # encrypted_consumer_key: Field::String,
    # encrypted_consumer_key_iv: Field::String,
    # encrypted_consumer_secret: Field::String,
    # encrypted_consumer_secret_iv: Field::String,
    # encrypted_access_token: Field::String,
    # encrypted_access_token_iv: Field::String,
    # encrypted_access_token_secret: Field::String,
    # encrypted_access_token_secret_iv: Field::String,
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
    :note,
    :rss_items,
    # :account_rss_items,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :account_rss_items,
    :rss_items,
    :id,
    :name,
    :note,
    :associate_tag,
    :status,
    :keywords,
    :consumer_key,
    :consumer_secret,
    :access_token,
    :access_token_secret,
    # :encrypted_consumer_key,
    # :encrypted_consumer_key_iv,
    # :encrypted_consumer_secret,
    # :encrypted_consumer_secret_iv,
    # :encrypted_access_token,
    # :encrypted_access_token_iv,
    # :encrypted_access_token_secret,
    # :encrypted_access_token_secret_iv,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :account_rss_items,
    :rss_items,
    :name,
    :note,
    :associate_tag,
    :status,
    :keywords,
    :consumer_key,
    :consumer_secret,
    :access_token,
    :access_token_secret,
    # :encrypted_consumer_key,
    # :encrypted_consumer_key_iv,
    # :encrypted_consumer_secret,
    # :encrypted_consumer_secret_iv,
    # :encrypted_access_token,
    # :encrypted_access_token_iv,
    # :encrypted_access_token_secret,
    # :encrypted_access_token_secret_iv,
  ].freeze

  # Overwrite this method to customize how accounts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(account)
  #   "Account ##{account.id}"
  # end
end
