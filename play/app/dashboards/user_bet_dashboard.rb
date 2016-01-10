require "administrate/base_dashboard"

class UserBetDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    bet: Field::BelongsTo,
    id: Field::Number,
    bet_on_id: Field::Number,
    bet_points: Field::Number,
    bet_team: Field::Number,
    won: Field::Number,
    loss: Field::Number,
    returned_value: Field::Number,
    closed: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :bet,
    :id,
    :bet_on_id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :bet,
    :bet_on_id,
    :bet_points,
    :bet_team,
    :won,
    :loss,
    :returned_value,
    :closed,
  ]

  # Overwrite this method to customize how user bets are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user_bet)
  #   "UserBet ##{user_bet.id}"
  # end
end
