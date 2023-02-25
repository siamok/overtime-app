# frozen_string_literal: true

require 'administrate/base_dashboard'

class EmployeeDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    posts: Field::HasMany.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    email: Field::String.with_options(searchable: true),
    password: Field::String.with_options(searchable: false),
    first_name: Field::String.with_options(searchable: false),
    last_name: Field::String.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    type: Field::String.with_options(searchable: false),
    phone: Field::String.with_options(searchable: false),
    ssn: Field::Number.with_options(searchable: true),
    company: Field::String.with_options(searchable: false)
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    posts
    email
    ssn
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    posts
    ssn
    company
    email
    phone
    first_name
    last_name
    created_at
    updated_at
    type
  ].freeze

  FORM_ATTRIBUTES = %i[
    ssn
    email
    phone
    password
    first_name
    last_name
    company
    type
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how admin users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(admin_user)
  #   "AdminUser ##{admin_user.id}"
  # end
end
