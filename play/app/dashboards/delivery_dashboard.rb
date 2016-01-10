require "administrate/base_dashboard"

class DeliveryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    prize: Field::BelongsTo,
    id: Field::Number,
    user_id: Field::Number,
    street: Field::String,
    state: Field::String,
    country: Field::String,
    zipcode: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :prize,
    :id,
    :user_id,
    :street,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :prize,
    :user_id,
    :street,
    :state,
    :country,
    :zipcode,
  ]

  # Overwrite this method to customize how deliveries are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(delivery)
  #   "Delivery ##{delivery.id}"
  # end
end
