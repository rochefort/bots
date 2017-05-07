require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    product_reviews: Field::HasMany,
    id: Field::Number,
    asin: Field::String,
    title: Field::String,
    authors: Field::String,
    binding: Field::String,
    format: Field::String,
    ean: Field::String,
    isbn: Field::String,
    label: Field::String,
    number_of_pages: Field::String,
    product_group: Field::String,
    publication_date: Field::String,
    manufacturer: Field::String,
    publisher: Field::String,
    studio: Field::String,
    is_adult_product: Field::Boolean,
    is_kindle: Field::Boolean,
    price: Field::Number,
    currency: Field::String,
    score: Field::Number.with_options(decimals: 2),
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
    :asin,
    :title,
    :authors,
    :score,
    :price,
    :product_reviews,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :product_reviews,
    :id,
    :asin,
    :title,
    :authors,
    :binding,
    :format,
    :ean,
    :isbn,
    :label,
    :number_of_pages,
    :product_group,
    :publication_date,
    :manufacturer,
    :publisher,
    :studio,
    :is_adult_product,
    :is_kindle,
    :price,
    :currency,
    :score,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :product_reviews,
    :asin,
    :title,
    :authors,
    :binding,
    :format,
    :ean,
    :isbn,
    :label,
    :number_of_pages,
    :product_group,
    :publication_date,
    :manufacturer,
    :publisher,
    :studio,
    :is_adult_product,
    :is_kindle,
    :price,
    :currency,
    :score,
  ].freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product)
  #   "Product ##{product.id}"
  # end
end
