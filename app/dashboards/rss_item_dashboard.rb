require "administrate/base_dashboard"

class RssItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    account_rss_items: Field::HasMany,
    accounts: Field::HasMany,
    rss_site: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    pub_date: Field::DateTime,
    description: Field::String,
    link: Field::String,
    guid: Field::String,
    status: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :account_rss_items,
    # :accounts,
    # :rss_site,
    :id,
    :title,
    :status,
    :pub_date,
    :description,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :account_rss_items,
    :accounts,
    :rss_site,
    :id,
    :title,
    :pub_date,
    :description,
    :link,
    :guid,
    :status,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :account_rss_items,
    :accounts,
    :rss_site,
    :title,
    :pub_date,
    :description,
    :link,
    :guid,
    :status,
  ].freeze

  # Overwrite this method to customize how rss items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(rss_item)
  #   "RssItem ##{rss_item.id}"
  # end
end
