require "administrate/base_dashboard"

class BetDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user_bets: Field::HasMany,
    id: Field::Number,
    team_one: Field::String,
    team_two: Field::String,
    team_one_chance: Field::Number,
    team_two_chance: Field::Number,
    team_one_value: Field::Number,
    team_two_value: Field::Number,
    winner: Field::Number,
    bets_on_team_one: Field::Number,
    bets_on_team_two: Field::Number,
    can_bet: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    match_starts_at: Field::DateTime,
    game: Field::String,
    bestof: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user_bets,
    :id,
    :team_one,
    :team_two,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user_bets,
    :team_one,
    :team_two,
    :team_one_chance,
    :team_two_chance,
    :team_one_value,
    :team_two_value,
    :winner,
    :bets_on_team_one,
    :bets_on_team_two,
    :can_bet,
    :match_starts_at,
    :game,
    :bestof,
  ]

  # Overwrite this method to customize how bets are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(bet)
  #   "Bet ##{bet.id}"
  # end
end
