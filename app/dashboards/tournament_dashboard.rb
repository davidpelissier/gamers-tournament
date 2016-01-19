require "administrate/base_dashboard"

class TournamentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    game: Field::BelongsTo,
    bo_tournaments: Field::HasMany,
    bos: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    teams_limit: Field::Number,
    signup_start: Field::DateTime,
    signup_end: Field::DateTime,
    check_in: Field::DateTime,
    date: Field::DateTime,
    mode: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :game,
    :bo_tournaments,
    :bos,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :game,
    :bo_tournaments,
    :bos,
    :name,
    :description,
    :teams_limit,
    :signup_start,
    :signup_end,
    :check_in,
    :date,
    :mode,
  ]

  # Overwrite this method to customize how tournaments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(tournament)
  #   "Tournament ##{tournament.id}"
  # end
end
