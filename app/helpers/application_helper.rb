# frozen_string_literal: true

module ApplicationHelper
  def admin_types
    ['AdminUser']
  end

  def active?(path)
    'active' if current_page?(path)
  end

  def employee?
    current_user.type == 'Employee'
  end

  def admin?
    admin_types.include?(current_user.type)
  end

  def status_label(status)
    status_span_generator(status)
  end

  private

  def status_span_generator(status)
    titleize_status = status.titleize
    case status
    when 'submitted'
      content_tag(:span, titleize_status, class: 'label label-primary')
    when 'approved'
      content_tag(:span, titleize_status, class: 'label label-success')
    when 'rejected'
      content_tag(:span, titleize_status, class: 'label label-danger')
    when 'pending'
      content_tag(:span, titleize_status, class: 'label label-primary')
    when 'confirmed'
      content_tag(:span, titleize_status, class: 'label label-success')
    end
  end
end
