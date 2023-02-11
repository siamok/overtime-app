# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    'active' if current_page?(path)
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
