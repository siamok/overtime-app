# frozen_string_literal: true

module PostsHelper
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
    end
  end
end
