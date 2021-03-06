require "administrate/base_dashboard"

class MatchDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tournament: Field::BelongsTo,
    team1: Field::BelongsTo.with_options(class_name: "Team"),
    team2: Field::BelongsTo.with_options(class_name: "Team"),
    id: Field::Number,
    map: Field::String,
    team1_id: Field::Number,
    team2_id: Field::Number,
    score_team1: Field::Number,
    score_team2: Field::Number,
    stream: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    screen_shot_file_name: Field::String,
    screen_shot_content_type: Field::String,
    screen_shot_file_size: Field::Number,
    screen_shot_updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :tournament,
    :team1,
    :team2,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :tournament,
    :team1,
    :team2,
    :map,
    :team1_id,
    :team2_id,
    :score_team1,
    :score_team2,
    :stream,
    :screen_shot_file_name,
    :screen_shot_content_type,
    :screen_shot_file_size,
    :screen_shot_updated_at,
  ]

  # Overwrite this method to customize how matches are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(match)
  #   "Match ##{match.id}"
  # end
end
