# frozen_string_literal: true

require 'date'

Jekyll::Hooks.register :posts, :pre_render do |post|
  if post.data['revisions']
    latest_revision = post.data['revisions'].keys.max
    raise unless latest_revision && (last_revised_on = Time.parse("#{latest_revision}"))

    post.data['revision_description'] = post.data['revisions'][latest_revision]
    post.data['last_revised_on'] = last_revised_on
    post.data['updated_on'] = last_revised_on
  else
    post.data['updated_on'] = post.date
  end
end
